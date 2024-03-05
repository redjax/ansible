# Description

My Ansible monorepo. Includes my roles, playbooks, & inventory files.

This repository is a refactor of [my old Ansible repository](https://gitlab.com/redjax/ansihost). It will be missing some things for a while as I re-work roles, playbooks, and directory structure.

This repository uses [Python Poetry](https://python-poetry.org) to stage the Ansible environment. To run this without a Python `virtualenv`, check the [Run without virtualenv](#run-without-virtualenv) section for instructions on installing dependencies straight to the host.

---

⚠️ **IMPORTANT NOTE**: I am slowly moving most of the contents of this `README` to the [`docs page`](https://redjax.github.io/ansible) for this repository. Things may not be completely up to date.

---

## Included modules

This repository uses [Python Poetry](https://python-poetry.org) to stage the Ansible environment. `Poetry` Installs environment from `pyproject.toml`.

Run `$ poetry install` after cloning repo to setup Ansible environment

- **Packages installed by Poetry**
  - [yamllint](https://yamllint.readthedocs.io/en/stable/quickstart.html#running-yamllint)
    - Lint `.yaml` files for key repetition, syntax, etc
    - Examples:
      - `$ yamllint file.yml other-file.yaml`
      - `$ yamllint .`
      - `$ yamllint file.yml -f colored`
  - [ARA Records Ansible](https://github.com/ansible-community/ara)
    - Records `ansible`/`ansible-playbook` commands, wherever they are run from
      - Terminal (by hand or a script)
      - Laptop, desktop, server, vm, or container
      - CI
  - [Ansible Runner](https://ansible-runner.readthedocs.io/en/stable/)
  - [Ansible Doctor](https://ansible-doctor.geekdocs.de/usage/getting-started/)
    - Document Ansible files with annotations
    - Intented to be run from a CI pipeline
  - [Molecule](https://molecule.readthedocs.io/en/latest/getting-started.html)
    - Aids in the developement & testing of Ansible roles/playbooks
  - [Ansible Navigator](https://github.com/ansible/ansible-navigator)
    - Text based user interface (TUI) for Ansible
  - [Ansible Lint](ansible-lint.readthedocs.io/)
    - Lint Ansible `.yml` files
    - Usage:
      - `$ ansible-lint /path/to/file-to-lint.yml`

## Run without virtualenv

If you would like to use another dependency manager (i.e. [PDM](pdm.fming.dev/)), or would prefer to just `pip install $pkg` straight to your host environment, make sure to install each of the dependencies in [the included modules](#included-modules) > "Packages installed by Poetry" section.

At minimum, to run Ansible playbooks and commands from this repository, you will need:

- ansible

The rest of the packages are optional, but might enhance desired operations, such as [Molecule](https://molecule.readthedocs.io/en/latest/getting-started.html) which aids in testing roles.

# Notes & Links

## Notes

### Create a new role

Creating a new role involves the following flow:

* (Optional, if using `Poetry` environment) Activate poetry env from git root
  * `$ poetry shell`
* Change directory to `ansible`
  * `$ cd ansible`
* Initialize a new role
  * `$ ansible-galaxy init roles/path/to/new-role-name`
* Add tasks/files/templates/ etc to the new role
* Create a playbook for the role in `plays/`
  * Check notes in [Create playbook for a role](#create-playbook-for-a-role) section to build your playbook
  * The repo is currently divided into `conf/`, `fixes/`, and `installs/` playbook types for organization
  * Any playbooks in the root directory are meant to be run on a completely fresh install, or do too much to be grouped into a subdirectory

### Create playbook for a role

After creating a new role, create a playbook to launch the role in `plays/`. Try to follow the existing directory structure to maintain organization.

**Example: Create playbook for install-app**

* `roles/common/install-app` directory structure:

```
...

tasks/
  configure.yml
  install.yml
  main.yml

...
```

* To create a playbook that runs the entire role, defined in `tasks/main.yml`:

```
## plays/installs/install-app.yml
---
- name: "Install app"
  hosts: all

  roles:
    - ../roles/path/to/role-name
```

* To create a playbook that only runs certain tasks from a role, i.e. a playbook to run configuration tasks for app defined in `roles/common/install-app`

```
## plays/conf/configure-app.yml
---
- name: "Configure app"
  hosts: all

  tasks:
    - include_role:
        name: ../../roles/common/install-app
        tasks_from: configure.yml
```

#### Run only certain tasks from role in a playbook

In a playbook, you can include a role and only include tasks from a specific file in the role's `tasks/` directory. For example, the `install-neovim` role installs `nodejs` in the `tasks/install_nodejs_{debian/redhat}_family.yml` task file. The following playbook, called `install-neovim.yml`, will run the `install_nodejs` playbook from the `install-neovim` role:

```
---
- name: Install NodeJS
  hosts: all

  tasks:
    ## Debian
    - include_role:
        name: ../../roles/common/install-neovim
        tasks_from: install_nodejs_debian_family.yml
      when: ansible_facts['os_family'] == "Debian"

    ## Redhat
    - include_role:
        name: ../../roles/common/install-neovim
        tasks_from: install_nodejs_redhat_family.yml
      when: ansible_facts['os_family'] == "RedHat"
```

### Playbook step examples

#### APT Update/Upgrade

```
- name: Update apt cache & upgrade packages
  become: true
  ansible.builtin.apt:
    upgrade: true
    update_cache: true
    cache_valid_time: 86400  # 1 day
  when: ansible_facts['os_family'] == "Debian"
```

#### APT update cache only

```
- name: Update apt cache
  become: true
  ansible.builtin.apt:
    update_cache: true
    cache_valid_time: 86400  # 1 day
  when: ansible_facts['os_family'] == "Debian"
```

#### Install packages with APT

```
- name: Install packages with apt
  become: true
  apt:
    name: "{{ item }}"

```

#### Upgrade packages with APT

```
- name: Upgrade all packages
  apt:
    upgrade: dist
    # force_apt_get: yes
  become: true
```

#### Check if Debian family server needs reboot

```
- name: Check if a reboot is needed
  register: reboot_required
  stat:
    path: /var/run/reboot-required
    get_md5: false

- name: Reboot server
  ansible.builtin.reboot:
    msg: "Reboot initiated by Ansible due to kernel updates"
    connect_timeout: 5
    reboot_timeout: 300
    pre_reboot_delay: 0
    post_reboot_delay: 30
    test_command: uptime
  when: reboot_rquired.stat.exists
```

#### Rebooting when

# Notes & Links

## Notes

### Troubleshooting

---

#### ERROR! couldn't resolve module/action 'community.general.ufw'

**Solution**

Add the `community.general` collection from Ansible Galaxy

`$ ansible-galaxy collection install community.general`

---

#### ERROR! couldn't resolve module/action 'ansible.posix.firewalld'

**Solution**

Add the `ansible.posix` collection from Ansible Galaxy

`$ ansible-galaxy collection install ansible.posix`

---

#### ERROR! couldn't resolve module/action 'community.crypto.openssh_keypair'

**Solution**

Add the `community.crypto` collection from Ansible Galaxy

`$ ansible-galaxy collection install community.crypto`

---

#### ERROR! couldn't resolve module/action 'pipx'

**Solution**

Add the `community.general` collection from Ansible Galaxy

`$ ansible-galaxy collection install community.general`

---

## Links

- Ansible Documentation Links
  - [Ansible Facts: Distribution](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_conditionals.html#ansible-facts-distribution)
  - [Ansible apt_key module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_key_module.html)
  - [Ansible apt_repository module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_repository_module.html)
  - [Ansible facts & magic variables](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html)
  - [Ansible ignore failed commands](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_error_handling.html#:~:text=By%20default%20Ansible%20stops%20executing,in%20spite%20of%20the%20failure.&text=The%20ignore_errors%20directive%20only%20works,a%20value%20of%20'failed'.)
  - [Ansible ignore unreachable hosts](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_error_handling.html#ignoring-unreachable-host-errors)

- [Ansible Real Life Good Practices](https://reinteractive.com/articles/Ansible-Real-Life-Good-Practices)
- [Ansible best practices (2017)](https://andidog.de/blog/2017-04-24-ansible-best-practices)
- [Git Ansible](https://adamtheautomator.com/git-ansible/)
  - Git operations (public & private repos) in Ansible playbooks
- [Testing your Ansible roles with Molecule](https://www.jeffgeerling.com/blog/2018/testing-your-ansible-roles-molecule)
- [Ansible apt update all packages on Ubuntu/Debian](https://www.cyberciti.biz/faq/ansible-apt-update-all-packages-on-ubuntu-debian-linux/)
- [Ansible get release name (i.e. "Jammy" for Ubuntu) from facts](https://superuser.com/a/1010846)
- [Ansible define multiple 'when' conditions](https://www.cyberciti.biz/faq/how-to-define-multiple-when-conditions-in-ansible/)
- [Ansible include tasks from role in playbook file](https://www.toptechskills.com/ansible-tutorials-courses/ansible-include-import-tasks-tutorial-examples/)
- [Reddit: Project directory structure](https://www.reddit.com/r/devops/comments/tvf1bo/comment/i39u2ox/?utm_source=share&utm_medium=web2x&context=3)
