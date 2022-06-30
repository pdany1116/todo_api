# Fetch ruby
FROM ruby:3.1.2 AS todo-api

# Create path where to install project
ENV INSTALL_PATH /usr/local/todo-api
RUN mkdir -p $INSTALL_PATH

# Set working directory in project path
WORKDIR $INSTALL_PATH

# Copy project files into container
COPY . .

# Install rails, bundler gems
RUN gem install rails bundler

# Install required gems
RUN bundle install

# Expose application's port to be accesible out of container
EXPOSE 3000
