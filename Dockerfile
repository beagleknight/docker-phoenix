FROM ultrayoshi/elixir
MAINTAINER david.morcillo@gmail.com

# Install node v5.x.x
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash - 
RUN apt-get install -y nodejs

# Install phoenix 1.1.4
RUN yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# Workaround for the mix command inside docker
# https://github.com/elixir-lang/elixir/issues/3342
ENTRYPOINT ["elixir", "--erl", "-smp disable", "/usr/local/bin/mix"]

# Run phoenix server by default
CMD ["phoenix.server"]
