### Usage

Include either the `bsdznc::default` recipe
or the`bsdznc::znc` recipe.

Alternatively, use the LWRP, e.g.,

```ruby
bsdznc 'default' do
  action :create
end

# Now make sure the SSL certificate exists, then start ZNC.

bsdznc 'default' do
  action :start
end
```

You must provide a valid SSL certificate.
If you use either recipe, you must create an encrypted data bag under
`certificates` with id `znc`.
See the [certificate cookbook].

Access the web admin at `https://example.com/`.
The ZNC server will listen for IRC connections on port `194`.

A minimal `znc.conf` will be created
with user `admin` and password `password`.
This should be changed immediately.

Note that this cookbook modifies `/etc/sysctl.conf`,
and is incompatible with any other cookbook that modifies this file.

[certificate cookbook]: https://supermarket.chef.io/cookbooks/certificate
