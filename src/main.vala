/*
* Copyright (c) 2017-2018 Liudas Drejeris (https://liudas.drejeriai.lt)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 3 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Liudas Drejeris <drejeris.liudas@gmail.com>
*/

public class MoviesApp : Gtk.Application {

  public MoviesApp() {
    Object(application_id: "com.github.drejerisliudas.movies", flags: ApplicationFlags.FLAGS_NONE);
  }

  protected override void activate() {
    var app_window = new Gtk.ApplicationWindow(this);

    var grid = new Gtk.Grid();
    grid.orientation = Gtk.Orientation.VERTICAL;
    grid.row_spacing = 6;

    var title_label = new Gtk.Label(_("Notifications"));

    grid.add(title_label);

    var show_button = new Gtk.Button.with_label(_("Show"));

    show_button.clicked.connect(() => {
      var notification = new Notification (_("Hello World"));
      var icon = new GLib.ThemedIcon ("dialog-warning");

      notification.set_body (_("This is my first notification!"));
      notification.set_icon (icon);
      this.send_notification ("com.github.drejerisliudas.movies", notification);
    });

    grid.add(show_button);

    var replace_button = new Gtk.Button.with_label (_("Replace"));

    replace_button.clicked.connect (() => {
      var notification = new Notification (_("Hello Again"));
      var icon = new GLib.ThemedIcon ("dialog-warning");

      notification.set_icon (icon);
      notification.set_body (_("This is my second Notification!"));

      this.send_notification ("com.github.drejerisliudas.movies", notification);
    });

    grid.add (replace_button);

    app_window.add(grid);
    app_window.show_all();
  }

  public static int main(string[] args) {
    var app = new MoviesApp();

    return app.run(args);
  }
}

