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

recipe 'bsdznc::default', 'Install, configure, and start the ZNC server.'

provides 'service[bsdznc]'
