FROM runpod/pytorch:2.2.0-py3.10-cuda12.1.1-devel-ubuntu22.04

# Set python3.11 as the default python
RUN ln -sf $(which python3.10) /usr/local/bin/python && \
    ln -sf $(which python3.10) /usr/local/bin/python3

# Install dependencies
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip && pip install uv
RUN uv pip install --upgrade -r /requirements.txt --no-cache-dir --system

# Add files
ADD handler.py .

# Run the handler
CMD python -u /handler.py
