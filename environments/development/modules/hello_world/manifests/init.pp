/*
 * Hello World
 * 
 */

class hello_world {
  file {"/tmp/vamshi.txt":
      ensure => present, 
      content => "Create file with this content Hello Vamshi"
  }
}