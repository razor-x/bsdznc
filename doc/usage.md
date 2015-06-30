### Usage

Include either the `bsdznc::default` recipe,
or use the LWRP directly, e.g.,

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
If you use the default recipe, this is handled by the [certificate cookbook].
You must have an encrypted data bag under `certificates` with id `znc`.
See the [certificate cookbook] docs for how to create this.

Access the web admin at `https://example.com/`.
The ZNC server will listen for IRC connections on port `194`.

A minimal `znc.conf` will be created
with user `admin` and password `password`.
This should be changed immediately.

The `znc.conf` file is only created if it does not exist:
it will not be touched otherwise.
You should backup this file regularly as it contains
all server and user settings configured through the web admin.

Note that this cookbook modifies `/etc/sysctl.conf`,
and is incompatible with any other cookbook that modifies this file.

[certificate cookbook]: https://supermarket.chef.io/cookbooks/certificate
