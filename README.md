# 🐍 Python Template

I strongly recommend to use this template in combination with VSCode

#### 🤔 Why you should use this template:

- It provides a boilerplate to kickstart your project.
- It enforces type hinting, which avoids many bugs before they get written.
- It enforces good coding style, naming conversions and documentation.
- It auto formats your code and imports.
- You get a better autocompletion and quick fixes for common problems.

#### ⚙️ Requirements:

- [git](https://git-scm.com/)
- [VSCode](https://code.visualstudio.com/)
- [Python](https://www.python.org/) (I recommend using [pyenv](https://github.com/pyenv/pyenv))

#### 🚀 How to use it:

- Clone this repository it using VSCode (Go to the `Source Control` tab and click on Clone Repository) or via the command line: `git clone https://github.com/michaelkoelle/python-template.git`. Change the directory `cd python-template`. Remove the old origin `git remote remove origin`. Create a new repository on github or gitlab. Then, use e.g. `git remote add origin https://github.com/<your-username>/<your-repo>.git` to add you new repository as origin. Finally, push your changes `git push -u origin main`. You can now also rename the folder if you want. Alternatively you can create a new repository, clone it and then download this repository as .zip and extract/overwrite the files in your project repository.
- Install the recommened extensions (there should be a pop up), otherwise type `CTRL+SHIFT+P` and search for `Show Recommended Extensions`.
- If you use pyenv, make sure you have a python version installed, otherwise install one: `pyenv install 3.10`
- Create a new virtual python environment using pyenv: `pyenv virtualenv env` and `pyenv activate env`. This is where your dependencies will be installed.
- Install the dependencies: `pip install -r requirements.txt`
- Go to the `Run and Debug` tab and run the progam.
- Add customize the `src/main.py` and add your own code into the [`/src`]() folder.
- FYI: Progam arguments can be inserted here: `/.vscode/launch.json`

#### 🤝 When sharing your code:

Save a `requirements.txt` file, so that other people can install all required dependencies: `pipreqs --savepath ./requirements.txt src`.

#### 📚 Libraries used:

- [black](https://github.com/psf/black): Formatter
- [isort](https://pycqa.github.io/isort/): Import Organizer
- [pipreqs](https://pypi.org/project/pipreqs/): For creating the requirements file

#### 🧰 Recommended VSCode Extensions:

- [One Dark Pro Theme](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme): Best Theme that supports tokenization. This means that colors have meaning e.g. Strings are green, Functions are blue, etc.
- [Python (Pylance)](https://marketplace.visualstudio.com/items?itemName=ms-python.python): Language Support for Python.
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments): Color Coding for Comments. Automatically highlights comments with TODO in it.
- [Gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens): Lets you view for every line when the code was committed and who wrote it.
- [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack): Lets you easily connect to another machine remotely using SSH. Also a easy way to view and download files you created on the remote machine.

#### 💾 Working with git:

I recommend using the Source Control tab of VSCode, here you can see all the changes, draft a commit message and push the code to the remote.

#### 📊 Slurm:

- Login to on of the nodes of the Slurm cluster. (e.g. `<cip-kennung>@remote.cip.ifi.lmu.de`), I recommend using the VSCode Remote Extension.
- Make sure pyenv is installed and ready to use. `pyenv -v`
- If you do not already have a python version installed with pyenv use e.g. `pyenv install 3.10` and specify the correct version for your project
- Clone the repository.
- You can find the configuration files in the `/jobs` directory
- Edit the `job.sh` file and insert your email address and customize it to your liking.
- Edit the `run-jobs.sh` file to fit you needs. I provided a simple example for a reinforcement learning usecase.
- You may need to modify the file permissions of `job.sh` and `run-jobs.sh` to be able to execute it with: `chmod +x job.sh` and `chmod +x run-jobs.sh`
- You can execute `jobs/run-jobs.sh` from the root of your project to schedule multiple runs in parallel. (**Caution**: On the LMU CIP Pool Cluster you can only execute 15 jobs in parallel and queue a total of 30 jobs.)

#### 🚧 Caveats

- There is only so much a template can do. Bad code is still bad code!
- Some libraries do not support type hinting.
- Package `isort` does not automatically remove unused imports, see discussion [here](https://github.com/PyCQA/isort/issues/1105).
- There is a problem with pyright and function overrides in subclasses, see discussion [here](https://github.com/microsoft/pyright/issues/1787). Workaround is to insert `pyright: reportIncompatibleMethodOverride=false` at the top of the file.

#### ❓ FAQ:

##### What is pyenv

pyenv is a Python version management tool that enables developers to easily switch between different Python versions. It helps to manage multiple Python installations without conflicts or interference, allowing for a more flexible and streamlined development process. pyenv is especially useful when working with different projects that require different Python versions. To install pyenv, follow the instructions provided on the [official GitHub page](https://github.com/pyenv/pyenv).

Some common pyenv commands include:

- `pyenv install <version>`: Install a specific Python version.
- `pyenv global <version>`: Set the global Python version.
- `pyenv local <version>`: Set the local Python version for the current project.
- `pyenv versions`: List all installed Python versions.

##### What is a virtual environment

Python virtual environments are isolated environments that enable developers to manage dependencies and Python versions for individual projects without interfering with other projects or the system-wide Python installation. Virtual environments help to avoid conflicts between different library versions, providing a clean and reproducible development setup for each project.

The pyenv-virtualenv plugin combines the power of pyenv and virtualenv, allowing you to manage Python versions and virtual environments seamlessly.

Some common pyenv virtualenv commands include:

- `pyenv virtualenv <python_version> <env_name>`: Create a virtual environment with a specific Python version
- `pyenv virtualenvs`: List all available virtual environments
- `pyenv activate <env_name>`: Activate a virtual environment
- `pyenv deactivate`: Deactivate the current virtual environment
- `pyenv uninstall <env_name>`: Delete a virtual environment

##### What is slurm

Slurm is an open-source, highly scalable, and fault-tolerant cluster management and job scheduling system for Linux clusters. It is not specific to Python but can be used to manage and schedule Python jobs on distributed computing resources. To get started with Slurm, refer to the [official documentation](https://slurm.schedmd.com/documentation.html) or the [LRZ documentation](https://doku.lrz.de/display/PUBLIC/SLURM+Workload+Manager)

#### 💬 Questions or Improvements?

Create a [issue](https://github.com/michaelkoelle/python-template/issues) or hit me up: [michael.koelle@ifi.lmu.de](mailto:michael.koelle@ifi.lmu.de)
