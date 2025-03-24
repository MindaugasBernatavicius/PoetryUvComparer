## Compare UV and Poetry

Example test uv (top) vs. poetry (bottom) to install, uninstall and reinstall cached dependencies: 

```
$ make setup-and-run 
docker build -t ubuntu-with-uv -f dockerfile-uv . 
[+] Building 0.7s (8/8) FINISHED                                                                                                           docker:default
 => [internal] load build definition from dockerfile-uv                                                                                              0.0s
 => => transferring dockerfile: 2.42kB                                                                                                               0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                                                  0.6s
 => [internal] load .dockerignore                                                                                                                    0.0s
 => => transferring context: 2B                                                                                                                      0.0s
 => [1/4] FROM docker.io/library/python:3.12-slim@sha256:a866731a6b71c4a194a845d86e06568725e430ed21821d0c52e4efb385cf6c6f                            0.0s
 => CACHED [2/4] WORKDIR /app                                                                                                                        0.0s
 => CACHED [3/4] RUN apt-get update && apt-get install -y && python -m venv /app/.venv                                                               0.0s
 => CACHED [4/4] RUN /app/.venv/bin/pip install uv                                                                                                   0.0s
 => exporting to image                                                                                                                               0.0s
 => => exporting layers                                                                                                                              0.0s
 => => writing image sha256:86ce1310a65eb720f6ae41fed8607320497fe97f33ad36d48bca60eeeb9ab554                                                         0.0s
 => => naming to docker.io/library/ubuntu-with-uv                                                                                                    0.0s
docker run --name ubuntu-with-uv -it ubuntu-with-uv
Initialized project `app`
Resolved 40 packages in 501ms
Prepared 38 packages in 6.39s
Uninstalled 1 package in 48ms
Installed 38 packages in 69ms
 + blinker==1.9.0
 ...
 + werkzeug==3.1.3

real    0m7.036s
user    0m1.145s
sys     0m2.020s

Resolved 1 package in 2ms
Uninstalled 37 packages in 97ms
 - blinker==1.9.0
 ...
 - werkzeug==3.1.3

real    0m0.114s
user    0m0.008s
sys     0m0.104s

Resolved 40 packages in 7ms
Installed 37 packages in 66ms
 + blinker==1.9.0
 ...
 + werkzeug==3.1.3

real    0m0.097s
user    0m0.033s
sys     0m0.187s
```
