# Show My Headers

[![security](https://hakiri.io/github/genebean/show-my-headers/master.svg)](https://hakiri.io/github/genebean/show-my-headers/master)

This is a simple [Sinatra](http://www.sinatrarb.com/) app that will print all
headers that start with `HTTP_` as the body of the main page.

## Why?

The main reason I wrote this app was so that I could verify what headers were
being delivered to upstream servers defined in Nginx. Below is an example usage:

```
# /etc/nginx/nginx.conf

location = /headers {
  proxy_pass http://127.0.0.1:9292/;
  proxy_set_header Host            $host;
  proxy_set_header X-Real-IP       $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```

## Running me

Open a terminal on your webserver and enter this:

```bash
cd /path/to/show-my-headers
bundle exec install
bundle exec rackup
```

Then, assuming you put the location block above in your config, go to
`http://your-site.com/headers` and you'll see what Nginx passed to Sinatra.
