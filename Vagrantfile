Vagrant.configure("2") do |config|
  config.vm.box = 'dummy'
  config.vm.box_url = '.\dummy.box'
  config.ssh.private_key_path = 'E:\VMware\VirtualMacheines\id_rsa'
  config.ssh.username = 'root'
  config.ssh.password = 'hirohome'
  
  config.vm.provider :vsphere do |vsphere|
    vsphere.host = '172.10.1.55'
    # vCenterのデータセンター名
    vsphere.data_center_name = 'Datacenter01'
    # VMを作成する先のホストマシン名
    vsphere.compute_resource_name = '172.10.1.50'
    # クローニングを使用するかどうか
    vsphere.clone_from_vm = true
    # VM作成可能な権限を持つvCenterのユーザ名
    vsphere.user = 'root'
    # 上記ユーザのパスワード
    vsphere.password = 'zaq12wsx'
    # 証明書のWarningを無視
    vsphere.insecure = true
    # クローン元のVM名
    vsphere.template_name = 'Template/Vagrant/centos66'
    # VMクローニング時に使用するカスタマイズスペック名
    vsphere.customization_spec_name = 'custspec-centos7'
    # 
    vsphere.data_store_name = 'hiRo00'
    vsphere.addressType = 'Manual'
    # 共有フォルダ 設定
    config.vm.synced_folder "E:\VMware\vagrant_shared", "/vagrant"
    # 共有フォルダ 無効設定
    config.vm.synced_folder ".", "/vagrant", disabled: true
  end
  
  # config.vm.define 'dnssrv10' do |dnssrv10|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:6f'
      # vsphere.name = 'dnssrv10'
      # vsphere.resource_pool_name = 'MNGnode'
      # config.ssh.host = '172.10.1.111'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  config.vm.define 'chesrv10' do |chesrv10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:79'
      vsphere.name = 'chesrv10'
      vsphere.resource_pool_name = 'MNGnode'
      config.ssh.host = '172.10.1.121'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'chewrk10' do |chewrk10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:7c'
      vsphere.name = 'chewrk10'
      vsphere.resource_pool_name = 'MNGnode'
      config.ssh.host = '172.10.1.124'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'ldasrv10' do |ldasrv10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:83'
      vsphere.name = 'ldasrv10'
      vsphere.resource_pool_name = 'MNGnode'
      config.ssh.host = '172.10.1.131'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'maisrv10' do |maisrv10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:85'
      vsphere.name = 'maisrv10'
      vsphere.resource_pool_name = 'ACCnode'
      config.ssh.host = '172.10.1.133'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'bacsrv10' do |bacsrv10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:87'
      vsphere.name = 'bacsrv10'
      vsphere.resource_pool_name = 'ACCnode'
      config.ssh.host = '172.10.1.135'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'zabmgr10' do |zabmgr10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:89'
      vsphere.name = 'zabmgr10'
      vsphere.resource_pool_name = 'MNGnode'
      config.ssh.host = '172.10.1.137'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'logsrv10' do |logsrv10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:8d'
      vsphere.name = 'logsrv10'
      vsphere.resource_pool_name = 'ACCnode'
      config.ssh.host = '172.10.1.141'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'jobmgr10' do |jobmgr10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:97'
      vsphere.name = 'jobmgr10'
      vsphere.resource_pool_name = 'MNGnode'
      config.ssh.host = '172.10.1.151'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'lvsapp10' do |lvsapp10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:a1'
      vsphere.name = 'lvsapp10'
      vsphere.resource_pool_name = 'WEBnode'
      config.ssh.host = '172.10.1.161'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'lvsapp20' do |lvsapp20|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:a2'
      vsphere.name = 'lvsapp20'
      vsphere.resource_pool_name = 'WEBnode'
      config.ssh.host = '172.10.1.162'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'lvsdbs10' do |lvsdbs10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:a5'
      vsphere.name = 'lvsdbs10'
      vsphere.resource_pool_name = 'DBnode'
      config.ssh.host = '172.10.1.165'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'lvsdbs20' do |lvsdbs20|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:a6'
      vsphere.name = 'lvsdbs20'
      vsphere.resource_pool_name = 'DBnode'
      config.ssh.host = '172.10.1.166'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'websrv10' do |websrv10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:ab'
      vsphere.name = 'websrv10'
      vsphere.resource_pool_name = 'WEBnode'
      config.ssh.host = '172.10.1.171'
      config.ssh.password = 'zaq12wsx'
    end
  end

  config.vm.define 'websrv20' do |websrv20|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:ac'
      vsphere.name = 'websrv20'
      vsphere.resource_pool_name = 'WEBnode'
      config.ssh.host = '172.10.1.172'
      config.ssh.password = 'zaq12wsx'
    end
  end

  # config.vm.define 'dbsmgr10' do |dbsmgr10|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:b5'
      # vsphere.name = 'dbsmgr10'
      # vsphere.resource_pool_name = 'DBnode'
      # config.ssh.host = '172.10.1.181'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  # config.vm.define 'dbsmgr20' do |dbsmgr20|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:b6'
      # vsphere.name = 'dbsmgr20'
      # vsphere.resource_pool_name = 'DBnode'
      # config.ssh.host = '172.10.1.182'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  # config.vm.define 'dbdat10' do |dbdat10|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:ba'
      # vsphere.name = 'dbdat10'
      # vsphere.resource_pool_name = 'DBnode'
      # config.ssh.host = '172.10.1.186'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  # config.vm.define 'dbdat20' do |dbdat20|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:bb'
      # vsphere.name = 'dbdat20'
      # vsphere.resource_pool_name = 'DBnode'
      # config.ssh.host = '172.10.1.187'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  # config.vm.define 'dbdat30' do |dbdat30|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:bc'
      # vsphere.name = 'dbdat30'
      # vsphere.resource_pool_name = 'DBnode'
      # config.ssh.host = '172.10.1.188'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  # config.vm.define 'dbdat40' do |dbdat40|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:bd'
      # vsphere.name = 'dbdat40'
      # vsphere.resource_pool_name = 'DBnode'
      # config.ssh.host = '172.10.1.189'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  config.vm.define 'mincra10' do |mincra10|
    config.vm.provider :vsphere do |vsphere, override|
      vsphere.addressType = 'Manual'
      vsphere.mac = '00:50:56:86:88:be'
      vsphere.name = 'mincra10'
      vsphere.resource_pool_name = 'GAMEnode'
      config.ssh.host = '172.10.1.190'
      config.ssh.password = 'zaq12wsx'
    end
  end

  # config.vm.define 'vpnsrv10' do |vpnsrv10|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:dd'
      # vsphere.name = 'vpnsrv10'
      # vsphere.resource_pool_name = 'ACCnode'
      # config.ssh.host = '172.10.1.221'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

  # config.vm.define 'nicoproxy' do |nicoproxy|
    # config.vm.provider :vsphere do |vsphere, override|
      # vsphere.addressType = 'Manual'
      # vsphere.mac = '00:50:56:86:88:de'
      # vsphere.name = 'nicoproxy'
      # vsphere.resource_pool_name = 'ACCnode'
      # config.ssh.host = '172.10.1.222'
      # config.ssh.password = 'zaq12wsx'
    # end
  # end

end


