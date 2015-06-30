name             'bsdznc'
maintainer       'Evan Sosenko'
maintainer_email 'razorx@evansosenko.com'
license          'Apache 2.0'
description      'FreeBSD ZNC server.'
source_url       'https://github.com/rxrc/bsdznc'
issues_url       'https://github.com/rxrc/bsdznc/issues'
version          '0.0.0'

supports 'freebsd', '~> 10.1'

depends 'cafe-core', '~> 0.0.1'
depends 'certificate', '~> 1.0.0'

recipe 'bsdznc::default', 'Setup the FreeBSD ZNC server with core services.'
recipe 'bsdznc::znc', 'Setup the FreeBSD ZNC server.'

provides 'service[bsdznc]'
