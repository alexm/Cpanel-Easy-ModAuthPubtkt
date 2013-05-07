package Cpanel::Easy::ModAuthPubtkt;

our $easyconfig = {
    'version' => '0.0.1',
    'name'    => 'Mod Auth Pubtkt',
    'note'    => 'Installs mod_auth_pubtkt Apache module without configuring it.',
    'url'     => 'https://github.com/alexm/Cpanel-Easy-ModAuthPubtkt',
    'src_cd2' => 'mod_auth_pubtkt-0.8',
    'hastargz' => 1,
    'step'    => {
        '0' => {
            'name'    => 'configure',
            'command' => sub {
                my ($self) = @_;

                return $self->run_system_cmd_returnable( [ './configure', '--apxs=' . $self->_get_main_apxs_bin() ] );
            },
        },

        '1' => {
            'name'    => 'make',
            'command' => sub {
                my ($self) = @_;

                return $self->run_system_cmd_returnable( [ 'make' ] );
            },
        },

        '2' => {
            'name'    => 'make install',
            'command' => sub {
                my ($self) = @_;

                return $self->run_system_cmd_returnable( [ 'make install' ] );
            },
        },
    },
};

1;
