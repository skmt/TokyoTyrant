tokyotyrant Cookbook
====================
This cookbook is to install configuration files of TokyoTyrant, including RC script, logrotation and so on.


Requirements
------------
Initinal release doesn't include a recipe to install package of TokyoTyrant. You can make its binary from the source code or rpm-install from repositories.


Attributes
----------
TokyoTyrant provides its service on the port number of 11311 as default, but you can change it and add another ports. In case of using multiple port the numbers must be lined in `tokyotyrant_ports` separated by comma.

#### tokyotyrant::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['tokyotyrant_ports']</tt></td>
    <td>Integer</td>
    <td>Port Number(s)</td>
    <td>11311</td>
  </tr>
</table>


Usage
-----
Just include `tokyotyrant` in your node's `run_list`:

```json
{
  "name":"my_node",
  "tokyotyrant_ports" : [
    "PORT_NUMBER", "PORT_NUMBER", .....
  ]
  "run_list": [
    "role[tokyotyrant]"
  ]
}
```


License and Authors
-------------------
Authors: Tsuyoshi TANAI, CyberAgent, Inc.
