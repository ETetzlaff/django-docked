ARG PYTHON_VERSION=3.11.0

FROM python:$PYTHON_VERSION-slim

# Install dependencies
RUN apt-get update -qq && \
	apt-get install -y \
		build-essential \
		gnupg2 \
		curl \
		git

# Mount $PWD to this workdir
WORKDIR /django

# Ensure python packages rae installed on a persistent volume and available
# as bins
# Make the folder world writable to let thd efault user install packages
RUN mkdir /pipenv && chmod -R ugo+rwt /pipenv
VOLUME /pipenv
ENV PIPENV_PATH='/pipenv'
ENV PATH="/pipenv/python/$PYTHON_VERSION/bin:${PATH}"

# Install pipenv
# RUN pip install pipenv

# Install Django
# RUN pipenv install Django

# Install Django
RUN pip install Django

# Ensure binding is 0.0.0.0 for container
ENV BINDING="0.0.0.0"

# Overwrite entrypoint?
ENTRYPOINT [""]
