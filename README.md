Nautilus Upload To
==================

Overview
--------

The Nautilus Upload To repository contains custom scripts that allow you to upload files to various file sharing services directly from the Nautilus file manager context menu. Whether you're sharing images, code snippets, or documents, this collection of scripts simplifies the process by integrating with popular file-sharing platforms.

Features
--------

-   **Context Menu Integration**: Right-click any file or folder in Nautilus, and you'll find an "Upload to" submenu with options for various services.
-   **Zenity GUI**: The scripts use [Zenity](https://help.gnome.org/users/zenity/stable/), a simple graphical user interface, to display progress and the resulting links.

Installation
------------

```bash
git clone https://github.com/Sush-ruta/nautilus-upload-to.git
cd nautilus-upload-to
cp -r "Upload to" "$HOME/.local/share/nautilus/scripts/"
chmod +x "$HOME/.local/share/nautilus/scripts/"*
```

Services
--------

| Service | Description |
| --- | --- |
| [0x0](https://0x0.st/) | Anonymous file hosting with a simple web interface. |
| [bashupload](https://bashupload.com/) | Upload files via a straightforward command-line interface. |
| [Catbox](https://catbox.moe/) | Image and file hosting with a focus on privacy. |
| [File Doge](https://filedoge.com/) | Easy file sharing with a cute doge mascot. |
| [Litterbox](https://litterbox.catbox.moe/) | Another Catbox-based service for file uploads. |
| [Temp.sh](https://temp.sh/) | Temporary file hosting with automatic deletion after a specified time. |
| [termbin](https://termbin.com/) | Share text snippets via the command line. |
| [tmpfiles](https://tmpfiles.org/) | Secure temporary file hosting. |
| [transfer_more](https://up.sceptique.eu/) | Upload files to Sceptique's transfer service. |
| [put.re](https://put.re/) | Work-in-progress: A service for uploading files. Currently not functional (see note below). |
| [Uguu](https://uguu.se/) | Work-in-progress: Another file-sharing service. Currently not functional (see note below). |

Note on WIP Scripts
-------------------

The `put.re` and `Uguu` scripts are currently failing to upload the files correctly. I'm working on resolving any issues, and I'll update the repository as soon as they're operational.

Feel free to explore the scripts, contribute, and customize them to your liking!

License
-------

This project is licensed under the [WTFPL (Do What The Fuck You Want To Public License)](https://github.com/Sush-ruta/custom-desktop/blob/main/LICENSE). You can find the full text of the license in the [LICENSE](LICENSE) file.

Disclaimer
----------

The scripts provided in this repository are offered as-is, without any warranty or guarantee. While I've made every effort to ensure their functionality and security, I cannot be held responsible for any unintended consequences or issues that may arise from their use. Please exercise caution and review the code before deploying it in a production environment.

Remember that some of the scripts are still in development (as indicated by the "WIP" label), and I'm actively working to improve them. If you encounter any problems or have suggestions, feel free to open an issue or contribute to the project.
