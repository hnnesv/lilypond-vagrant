# the version of lilypond to install
$lilypond_version = "2.18.0"

# defaults for Exec
Exec {
	    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin", "/usr/local/sbin"],
		user => 'root',
}

# Make sure package index is updated (when referenced by require)
exec { "apt-get update":
    command => "apt-get update",
    user => "root",
}

# Install these packages after apt-get update
define apt::package($ensure='latest') {
	package { $name:
		ensure => $ensure,
		require => Exec['apt-get update'];
	}
}

apt::package { "guile-2.0": ensure => latest }
apt::package { "fontconfig": ensure => latest }
apt::package { "ghostscript": ensure => latest }
apt::package { "make": ensure => latest }
apt::package { "pdftk": ensure => latest }

$archive = "lilypond-${lilypond_version}-1.linux-x86.sh"

exec { "download-lilypond":
	command => "wget -P /vagrant/binaries http://download.linuxaudio.org/lilypond/binaries/linux-x86/${archive}",
	creates => "/vagrant/binaries/${archive}",
	timeout => 0
}

exec { "install-lilypond":
	cwd => "/vagrant/binaries",
	command => "bash ${archive} --batch",
	require => [Package["guile-2.0"], Package["fontconfig"], Package["ghostscript"], Exec["download-lilypond"]]
}

exec { "symlink-scores":
	command => "ln -s /vagrant/scores /home/vagrant/scores"
}
