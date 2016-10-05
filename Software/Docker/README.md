# DFS Analytics Toolbox

## About the image
This is the Docker image that goes with the eBook [_Mastering DFS Analytics_](https://leanpub.com/masteringdfsanalytics).

Contributing to the project is really quite simple:
1. Read the code of conduct at <https://github.com/znmeb/mastering-dfs-analytics-bookdown/blob/master/Software/CONDUCT.md>.
2. Everything starts with an issue. See [Always start with an issue](https://about.gitlab.com/2016/03/03/start-with-an-issue/) for the philosophy.
    * Is the documentation unclear? [File an issue](https://github.com/znmeb/mastering-dfs-analytics-bookdown/issues/new).
    * Did you find a bug? [File an issue](https://github.com/znmeb/mastering-dfs-analytics-bookdown/issues/new).
    * Do you want to request a feature? [File an issue](https://github.com/znmeb/mastering-dfs-analytics-bookdown/issues/new).

*Please, don't go through the mechanics of forking / pull requests even for trivial typo changes without filing an issue. [File an issue](https://github.com/znmeb/mastering-dfs-analytics-bookdown/issues/new).*

## Getting started
1. Install a Docker host. I regularly test with Docker for Windows on Windows 10 Pro and on Fedora 24 with the Fedora-provided Docker. This should work with any Docker host at release 1.10 or later.
2. Download and unpack the zip archive <https://github.com/znmeb/mastering-dfs-analytics-bookdown/raw/master/docker-commands.zip>. This contains script files to simplify the process of getting started.
3. Open a terminal / command line window and enter the directory where you unpacked the zip archive and type `./1pull.cmd`. This will download the Docker image. This can take a while; it's about 1.6 gigabytes.
4. Set the password in the image for the `dfstools` user. Type `./2set-password.cmd`. You will be prompted for a password. Enter the same password twice. If you mistype one of the entries, simply run the script again.
5. Install RStudio Server preview release. Type `./3install-rstudio-preview.cmd`.
6. Start the RStudio Server in a container. Type `./4rstudio-detach.cmd`.
7. Browse to <http://localhost:7878>. Log in as user `dfstools` with the password you set above.
8. Do your thing.
9. When your thing is done, close the RStudio session. Press the red "power off" button in the upper right.
10. Go back to the terminal and type `./5stop-and-save.cmd`. As the name suggests, this will stop the container and save the image to the Docker host filesystem. To resume using the saved image, go back to the `./4rstudio-detach.cmd` step.

## Alternate developer scripts
* build.cmd: builds the image locally, rather than downloading it like `1pull.cmd`.
* install-rstudio-stable.cmd: install the stable version of RStudio Server instead of the preview
* install-texlive-full.cmd: if you do a lot of PDF generation, you may find missing LaTeX packages. If this happens, run `./install-texlive-full.cmd` on the Docker host. This will install ***all*** of TeXLive. It adds about 4 GB to the image and takes quite a bit of time.
* rstudio-interactive.cmd: instead of running RStudio Server in the background, run it in the terminal where you can see all its log messages. Type `CTL-C` ***once*** to stop the server. You do not need to run `5stop-and-save.cmd` afterwards.

## Jupyter notebook server
Although RStudio Server Preview release is my preferred development environment, many data scientists use Jupyter notebooks, especially for Python-based data science. So I've provided the option to install the Jupyter notebook server and run it in the container. Note that you can install both Jupyter and RStudio Server but you can only have one of them running at any given invocation of the image in a container.

* install-jupyter.cmd: install the Jupyter notebook server. At present, only Python 3 and R are available, but Julia can be added easily.
* jupyter-detach.cmd: run the Jupyter notebook server in the background, detached. Run `5stop-and-save` when done just as with RStudio Server.
* jupyter-interactive.cmd: run the Jupyter notebook server in the terminal. Type `CTL-C` to stop the server. You do not have to run `5stop-and-save`.
* Browse to <http://localhost:7777> to use the Jupyter notebook.
