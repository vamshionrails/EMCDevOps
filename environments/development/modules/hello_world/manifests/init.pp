class hello_world {
  
  file {"/tmp/vamshi.txt":
      ensure => present,
      source => "puppet:///files/vamshi.txt" 
    
  }

}