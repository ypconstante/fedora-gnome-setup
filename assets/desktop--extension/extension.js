/* extension.js
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

/* exported init */

/*
 * usage
 * gdbus call --session --dest org.gnome.Shell --object-path /com/github/ypconstante/setup --method com.github.ypconstante.setup.toggleGnomeTerminal
 *
 * global object documentation - https://gjs-docs.gnome.org/meta9~9_api/
 * debug - press alt+f2 - lg
 */

const Gio = imports.gi.Gio
const Util = imports.misc.util

const IFACE = `
    <node>
        <interface name="com.github.ypconstante.setup">
            <method name="toggleGnomeTerminal">
            </method>
        </interface>
    </node>
`

class Extension {
    constructor() {
    }

    enable() {
        this._dbus = Gio.DBusExportedObject.wrapJSObject(IFACE, this)
        this._dbus.export(Gio.DBus.session, '/com/github/ypconstante/setup')
    }

    disable() {
        if (this._dbus) {
            this._dbus.flush()
            this._dbus.unexport()
            this._dbus = null
        }
    }

    toggleGnomeTerminal() {
        try {
            const window = global
                .get_window_actors()
                .filter(e => !e.is_destroyed())
                .map(e => e.get_meta_window())
                .find(e => e.get_gtk_application_id() === 'org.gnome.Terminal')

            if (window && window.has_focus()) {
                window.minimize()
            } else if (window) {
                window.change_workspace(global.workspace_manager.get_active_workspace())
                window.activate_with_workspace(global.get_current_time(), global.workspace_manager.get_active_workspace())
            } else {
                Util.spawn(['gnome-terminal'])
            }
        } catch (e) {
            logError(e, 'toggleGnomeTerminal Error')
        }
    }
}

function init() {
    return new Extension()
}

