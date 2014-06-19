$jre_major = '7'
$jre_update = '60'

# TODO: wget this first
package { "Java ${jre_major} Update ${jre_update}":
  ensure          => installed,
  source          => "c:\\vagrant\\jre-${jre_major}u${jre_update}-windows-i586.exe",
  install_options => ['/s', 'WEB_JAVA=0'],
}
windows_env { 'JAVA_HOME=C:\Program Files (x86)\Java\jre7':
  mergemode => 'clobber'
}

create_resources(host, hiera_hash('hosts'))

include maestro::agent
