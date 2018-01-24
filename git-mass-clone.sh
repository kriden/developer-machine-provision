#!/usr/bin/env groovy
import groovy.json.JsonSlurper;

def cli = new CliBuilder(usage:'git-mass-clone options [projects]', header: 'clones all your repositories based on projects.')
cli.u(args:1, argName:'username', 'Bitbucket username')
cli.pw(args:1, argName:'password', 'Bitbucket pasword')
def options = cli.parse(args)

def usr = options.u
def pwd = options.pw
def projects = options.arguments();

if(!usr || !pwd) {
  println cli.usage();
  System.exit(0);
}

def authString  = "${usr}:${pwd}".getBytes().encodeBase64().toString()
def apiString = 'https://bitbucket.org/api/2.0/repositories/capgeminidcx/?pagelen=50'
URL apiUrl = new URL(apiString)
def conn = apiUrl.openConnection();
conn.setRequestProperty( "Authorization", "Basic ${authString}" )
def response = new JsonSlurper().parseText(conn.content.text)


response.values.each { repo ->
  def base = repo.project.name.toLowerCase()

  if(projects.empty || projects.contains(base)) {
    def url = "https://bitbucket.org/${repo.full_name}"
    def defaultBranch = repo.mainbranch.name
    def target = base.replaceAll(" ", "")+"/"+repo.name

    def proc = ["git", "clone", url, target].execute();
    def outputStream = new StringBuffer();
    proc.waitForProcessOutput(outputStream, System.err);
    println outputStream.toString();
  }
}
