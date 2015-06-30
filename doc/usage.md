### Usage

Include either the default or znc recipe.
See the recipe specific instructions below for
the data bags required to use each recipe.

For more control, use the LWRP,

```ruby
bsdznc 'default' do
  action [:create, :start]
end
```

Access the web admin at `https://hostname/`.

A minimal `znc.conf` will be created
with user `admin` and password `password`.
This should be changed immediately.
