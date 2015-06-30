name             'bsdznc'
maintainer       'Evan Sosenko'
maintainer_email 'razorx@evansosenko.com'
license          'Apache 2.0'
description      'FreeBSD ZNC server.'
source_url       'https://github.com/rxrc/bsdznc'
issues_url       'https://github.com/rxrc/bsdznc/issues'
version          '0.0.0'

supports 'freebsd', '~> 10.1'

depends 'certificate', '~> 1.0.0'
depends 'sysctl', '~> 0.6.2'

recipe 'bsdznc::default', 'Install, configure, and start the ZNC server.'

provides 'service[bsdznc]'

attribute 'bsdznc/user',
          display_name: 'ZNC user',
          description: 'User to run znc as.',
          type: 'string',
          recipes: ['cafe-core::default'],
          default: 'znc'

attribute 'bsdznc/group',
          display_name: 'ZNC group',
          description: 'Group to run znc as.',
          type: 'string',
          recipes: ['cafe-core::default'],
          default: 'znc'

attribute 'bsdznc/uid',
          display_name: 'ZNC user id',
          description: 'User id for the znc user.',
          type: 'numeric',
          recipes: ['cafe-core::default'],
          default: 194

attribute 'bsdznc/gid',
          display_name: 'ZNC group id',
          description: 'Group id for the znc group.',
          type: 'numeric',
          recipes: ['cafe-core::default'],
          default: 194

attribute 'bsdznc/version',
          display_name: 'ZNC version',
          description: 'ZNC version to use for the default config.',
          type: 'string',
          recipes: ['cafe-core::default'],
          default: '1.6.0'

attribute 'bsdznc/config_path',
          display_name: 'ZNC config path',
          description: 'Path to the ZNC configuration directory.',
          type: 'string',
          recipes: ['cafe-core::default'],
          default: '/usr/local/etc/znc'

attribute 'bsdznc/cert_file',
          display_name: 'SSL certificate',
          description: 'SSL certificate filename.',
          type: 'string',
          recipes: ['cafe-core::default'],
          default: 'znc.pem'

attribute 'bsdznc/irc_port',
          display_name: 'IRC port',
          description: 'Port to listen on for IRC connections.',
          type: 'numeric',
          recipes: ['cafe-core::default'],
          default: 194

attribute 'bsdznc/web_port',
          display_name: 'Web admin port',
          description: 'Port to listen on for https connections.',
          type: 'numeric',
          recipes: ['cafe-core::default'],
          default: 443

attribute 'bsdznc/uri_prefix',
          display_name: 'URI prefix',
          description: 'Prefix to serve the web admin under.',
          type: 'string',
          recipes: ['cafe-core::default'],
          default: '/'
