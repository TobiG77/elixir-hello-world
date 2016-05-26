FROM tobig77/elixir-on-xenial-xerus

MAINTAINER Tobias Gerschner <tobias.gerschner@gmail.com>

COPY source/ /source/

RUN cd /source/ && \
    mix local.hex --force && \
    mix local.rebar --force

RUN cd /source/ && \
    rm -rf deps build _build rel && \
    mix do deps.get, deps.compile && \
    MIX_ENV=test mix test --color --trace && \
    mix do deps.get, deps.compile, release

RUN find /source/rel |grep bin

EXPOSE 4000

ENTRYPOINT ["/source/rel/hello_world/bin/hello_world", "foreground"]
