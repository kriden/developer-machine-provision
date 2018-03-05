#!/usr/bin/env groovy
import groovy.json.JsonSlurper;

def cli = new CliBuilder(usage:'git-list-prs ', header: 'Approves all pull requests approved by other approver.')
cli.u(args:1, argName:'username', 'Bitbucket username')
cli.pw(args:1, argName:'password', 'Bitbucket pasword')
cli.approver(args:1, argName:'approver', 'Approving user')
def options = cli.parse(args)

def usr = options.u
def pwd = options.pw
def approver = options.approver

println "Approving all PR approved by <${approver}>"
println "";

if(!usr || !pwd) {
  println cli.usage();
  System.exit(0);
}

class Util {

  def fetchData(endpoint, usr, pwd) {
    def authString  = "${usr}:${pwd}".getBytes().encodeBase64().toString()
    def apiString = "https://bitbucket.org/api/2.0/${endpoint}"
    URL apiUrl = new URL(apiString)
    def conn = apiUrl.openConnection();
    conn.setRequestProperty( "Authorization", "Basic ${authString}" )
    return new JsonSlurper().parseText(conn.content.text)
  }

  def getRepositories(name, usr, pwd) {
    return fetchData("repositories/${name}/?pagelen=50", usr, pwd);
  }

  def approve(pullRequestUrl, usr, pwd) {
    def authString  = "${usr}:${pwd}".getBytes().encodeBase64().toString()
    def url = "https://bitbucket.org/api/2.0/repositories/"+pullRequestUrl+"/approve";
    URL apiUrl = new URL(url)
    def conn = apiUrl.openConnection();
    conn.setRequestMethod("POST");
    conn.setRequestProperty( "Authorization", "Basic ${authString}" );

    conn.setDoOutput(true)
    def writer = new OutputStreamWriter(conn.getOutputStream())
    writer.close()
    reader.close()
  }
}

def util = new Util();
def repos = util.getRepositories("capgeminidcx", usr, pwd)
repos.values.each { repo ->
  def data = util.fetchData("repositories/${repo.full_name}/pullrequests", usr, pwd)
  data.values.each { pr ->
    def pullRequest = util.fetchData("repositories/${repo.full_name}/pullrequests/${pr.id}", usr, pwd)

    def approved = false;
    def approvedByUser = false;
    pullRequest.participants.each { person ->
      if(person.role == "REVIEWER" && person.user.username == approver && person.approved) {
        approved = true;
      }

      if(person.user.username == usr && person.approved) {
        approvedByUser = true;
      }
    }

    if(approved && !approvedByUser) {
      println "${pullRequest.title} has been approved by ${approver}. AUTO-APPROVING"
      println pullRequest.links.html.href
      util.approve(pullRequest.source.repository.full_name+"/pullrequests/"+pullRequest.id, usr, pwd)
      println ""
    }
  }
}
