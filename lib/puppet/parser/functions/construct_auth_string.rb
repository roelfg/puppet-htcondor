module Puppet::Parser::Functions
  # rubocop:disable Style/HashSyntax
  newfunction(:construct_auth_string, :type => :rvalue) do |args|
    # rubocop:enable Style/HashSyntax
    raise(Puppet::ParseError, "construct_auth_string() wrong number of arguments. Given: #{args.size} for 7)") if args.size != 7
    use_fs_auth = args[0]
    use_password_auth = args[1]
    use_kerberos_auth = args[2]
    use_claim_to_be_auth = args[3]
    use_anonymous_auth = args[4]
    use_ssl_auth = args[5]
    use_idtokens_auth = args[6]

    fs_string = 'FS'
    pw_string = 'PASSWORD'
    krb_string = 'KERBEROS'
    ctb_string = 'CLAIMTOBE'
    anon_string = 'ANONYMOUS'
    ssl_string = 'SSL'
    idtokens_string = 'IDTOKENS'

    auth_methods = []
    if use_fs_auth == true
      auth_methods.push fs_string
    end
    if use_password_auth == true
      auth_methods.push pw_string
    end
    if use_kerberos_auth == true
      auth_methods.push krb_string
    end
    if use_claim_to_be_auth == true
      auth_methods.push ctb_string
    end
    if use_anonymous_auth == true
      auth_methods.push anon_string
    end
    if use_ssl_auth == true
      auth_methods.push ssl_string
    end
    if use_idtokens_auth == true
      auth_methods.push idtokens_string
    end

    return auth_methods.join(',')
  end
end
