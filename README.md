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

```
$ make setup-and-run 
docker build -t ubuntu-with-poetry -f dockerfile-poetry . 
[+] Building 1.2s (8/8) FINISHED                                                                                                           docker:default
 => [internal] load build definition from dockerfile-poetry                                                                                          0.0s
 => => transferring dockerfile: 1.05kB                                                                                                               0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                                                  1.1s
 => [internal] load .dockerignore                                                                                                                    0.0s
 => => transferring context: 2B                                                                                                                      0.0s
 => [1/4] FROM docker.io/library/python:3.12-slim@sha256:a866731a6b71c4a194a845d86e06568725e430ed21821d0c52e4efb385cf6c6f                            0.0s
 => CACHED [2/4] WORKDIR /app                                                                                                                        0.0s
 => CACHED [3/4] RUN apt-get update && apt-get install -y && python -m venv /app/.venv                                                               0.0s
 => CACHED [4/4] RUN /app/.venv/bin/pip install poetry                                                                                               0.0s
 => exporting to image                                                                                                                               0.0s
 => => exporting layers                                                                                                                              0.0s
 => => writing image sha256:999406ab82e88c75b56db64bfb83b0bf9343a3bc99a96fbce12669c6a9507558                                                         0.0s
 => => naming to docker.io/library/ubuntu-with-poetry                                                                                                0.0s
docker run --name ubuntu-with-poetry -it ubuntu-with-poetry
Using version ^2.32.3 for requests
Using version ^3.1.0 for flask
Using version ^2.6.1 for pygame
Using version ^6.8.1 for pyqt6
Using version ^5.1.7 for django

Updating dependencies
Resolving dependencies... (1.8s)

Package operations: 14 installs, 0 updates, 0 removals

  - Installing markupsafe (3.0.2)
  ...
  - Installing pyqt6 (6.8.1)

Writing lock file

real    0m12.397s
user    0m3.964s
sys     0m2.856s
Updating dependencies
Resolving dependencies... (0.1s)

Package operations: 0 installs, 0 updates, 14 removals

  - Removing asgiref (3.8.1)
  ...
  - Removing werkzeug (3.1.3)

Writing lock file

real    0m6.102s
user    0m4.450s
sys     0m1.535s
The following packages are already present in the pyproject.toml and will be skipped:

  - requests

If you want to update it to the latest compatible version, you can use `poetry update package`.
If you prefer to upgrade it to the latest available version, you can use `poetry add package@latest`.

Using version ^3.1.0 for flask
Using version ^2.6.1 for pygame
Using version ^6.8.1 for pyqt6
Using version ^5.1.7 for django

Updating dependencies
Resolving dependencies... (0.1s)

Package operations: 14 installs, 0 updates, 0 removals

  - Installing markupsafe (3.0.2)
  ...
  - Installing pyqt6 (6.8.1)

Writing lock file

real    0m3.738s
user    0m2.923s
sys     0m1.362s
```
