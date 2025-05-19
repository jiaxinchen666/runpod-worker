FROM runpod/base:0.5.1-cpu

# Set python3.11 as the default python
RUN ln -sf $(which python3.10) /usr/local/bin/python && \
    ln -sf $(which python3.10) /usr/local/bin/python3

# Install dependencies
COPY requirements.txt /requirements.txt
RUN uv pip install --upgrade -r /requirements.txt --no-cache-dir --system

# Add files
ADD handler.py .

# Run the handler
CMD python -u /handler.py
