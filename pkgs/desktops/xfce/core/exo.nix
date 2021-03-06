{ stdenv, fetchurl, pkgconfig, intltool, URI, glib, gtk, libxfce4ui, libxfce4util
, hicolor-icon-theme }:

stdenv.mkDerivation rec {
  p_name  = "exo";
  ver_maj = "0.10";
  ver_min = "7";

  src = fetchurl {
    url = "mirror://xfce/src/xfce/${p_name}/${ver_maj}/${name}.tar.bz2";
    sha256 = "521581481128af93e815f9690020998181f947ac9e9c2b232b1f144d76b1b35c";
  };
  name = "${p_name}-${ver_maj}.${ver_min}";

  outputs = [ "out" "dev" "devdoc" ];
    # lib/xfce4/exo-1/exo-compose-mail-1 is a perl script :-/

  nativeBuildInputs = [ pkgconfig intltool ];
  buildInputs = [ URI glib gtk libxfce4ui libxfce4util hicolor-icon-theme ];

  meta = with stdenv.lib; {
    homepage = "https://docs.xfce.org/xfce/${p_name}/start";
    description = "Application library for the Xfce desktop environment";
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
  };
}
