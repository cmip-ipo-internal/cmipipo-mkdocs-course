# Install Python

You need Python 3.10 or newer. We use **Miniconda**, which installs Python and the
`conda` command.

!!! note "ESA machines"
    If you are on an ESA computer, use the **managed Python installation**
    provided by ESA IT. Do not install your own Python. Skip to
    [Check your install](#check-your-install).

## Install Miniconda

Download the installer for your system from
`https://docs.anaconda.com/miniconda/`.

### Windows

1. Run the `.exe` installer and accept the defaults.
2. Open **Anaconda Prompt** from the Start menu.

### macOS

1. Run the `.pkg` installer and accept the defaults.
2. Open a new Terminal window.

### Linux

```bash
mkdir -p ~/miniconda3
curl -o ~/miniconda3/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
```

Close the terminal and open a new one.

## Create the course environment

Run this once in your terminal (Anaconda Prompt on Windows):

```bash
conda create -n cmip-course python=3.12 -y
conda activate cmip-course
```

Run `conda activate cmip-course` each time you open a terminal for this project.

## Mamba (optional)

Mamba is a faster drop-in for `conda`. You do not need it for this course. Every
command here works with `conda`.

## Install make

`make` runs the project commands.

- **Windows:** in Anaconda Prompt, run `conda install -n cmip-course make -y`, or use Git Bash.
- **macOS:** `make` comes with the Xcode command line tools. If it is missing, run `xcode-select --install`.
- **Linux:** run `sudo apt install make -y` on Debian or Ubuntu.

## Check your install

Run these in your terminal. Each should print a version number.

```bash
python --version
pip --version
make --version
```

On some Linux systems the command is `python3`. If so, use
`make install PYTHON=python3` in the next step.
