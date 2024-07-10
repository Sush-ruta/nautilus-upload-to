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

### File Sharing Services
|                                    | File Sharing Services                      |                                              |
| ---------------------------------- | ------------------------------------------ | -------------------------------------------- |
| [0x0](https://0x0.st/)             | [bashupload](https://bashupload.com/)      | [Catbox](https://catbox.moe/)                |
| [File Doge](https://filedoge.com/) | [Litterbox](https://litterbox.catbox.moe/) | [Temp.sh](http://Temp.sh)                    |
| [tmpfiles](https://tmpfiles.org/)  | [transfer_more](https://up.sceptique.eu/)  | [Gofile](https://gofile.io/)                 |
| [fluffy](https://fluffy.cc/)       | [file.io](http://file.io)                  | [NixNet Upload](https://up.nixnet.services/) |
| [Oshi](https://oshi.at/)           | [Firefox Send](https://send.vis.ee/)       | [KrakenFiles](https://krakenfiles.com/)      |
| [pastor](https://c-v.sh/)          | [curl.by](http://curl.by)                  | [x0.at](http://x0.at)                        |
| [t0.vc](http://t0.vc)              | [CCU.to](http://CCU.to)                    | [ki.tc](http://ki.tc)                        |
| [BowFile](https://bowfile.com/)    | [buzzheavier](https://buzzheavier.com/)    |                                              |
### Pastebin Services
|                                 | Pastebin Services         |                             |
| ------------------------------- | ------------------------- | --------------------------- |
| [termbin](https://termbin.com/) | [pb1n.de](http://pb1n.de) | [clbin](https://clbin.com/) |
| [paste.rs](http://paste.rs)     |                           |                             |

### Image Hosting Services
|                                         | Image Hosting Services  |     |
| --------------------------------------- | ----------------------- | --- |
| [Freeimage.host](http://Freeimage.host) | [vgy.me](http://vgy.me) |     |

### Work-in-progress
|                               | Work-in-progress         |                                               |
| ----------------------------- | ------------------------ | --------------------------------------------- |
| [put.re](http://put.re)       | [Uguu](https://uguu.se/) | [Disroot Upload](https://upload.disroot.org/) |
| [Ufile.io](https://ufile.io/) |                          |                                               |

Note on WIP Scripts
-------------------

Some scripts are currently failing to upload the files correctly. I'm working on resolving any issues, and I'll update the repository as soon as they're operational.

Feel free to explore the scripts, contribute, and customize them to your liking!

License
-------

This project is licensed under the [WTFPL (Do What The Fuck You Want To Public License)](https://github.com/Sush-ruta/custom-desktop/blob/main/LICENSE). You can find the full text of the license in the [LICENSE](LICENSE) file.

Disclaimer
----------

The scripts provided in this repository are offered as-is, without any warranty or guarantee. While I've made every effort to ensure their functionality and security, I cannot be held responsible for any unintended consequences or issues that may arise from their use. Please exercise caution and review the code before deploying it in a production environment.

Remember that some of the scripts are still in development (as indicated by the "WIP" label), and I'm actively working to improve them. If you encounter any problems or have suggestions, feel free to open an issue or contribute to the project.
