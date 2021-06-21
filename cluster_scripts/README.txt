# Copyright (c) 2019 ZettaDB inc. All rights reserved.
# This source code is licensed under Apache 2.0 License,
# combined with Common Clause Condition 1.0, as detailed in the NOTICE file.

�������ݿ⼯Ⱥһ������ʹ��˵��

��˵�����������ʹ��һ�����������м�Ⱥ�İ�װ��������ֹͣ���Լ����������ù���������һ̨
Linux����������ָ�������ã������ݿ⼯Ⱥ�ĸ����ڵ�(�洢�ڵ�Ⱥ������ڵ�Ⱥ����Ⱥ����ڵ㣩
��װ��ָ����Ŀ������ϣ����Ҵ�ü�Ⱥ���ù��߻���ֹͣ��Ⱥ������������Ⱥ���Լ���������
��Ⱥ��

����Ҫ��:
1 ���нڵ����ڻ�����ΪLinux, ��װ��bash, sed, gzip, python2, python2-dev�ȹ��߻��߿⡣python 2��ִ�г�������Ϊpython2
2 ���м�Ⱥ�ڵ����ڻ����Ѿ���ȷ���ú��û����ڵ㽫�Ը��û����������û��ܹ�����sudo������Ҫ���롣
3 ���ڰ�װ�洢�ڵ�Ļ�������ҪԤ�Ȱ�װ���¿�(�˴�Ϊubuntu 20.04): libncurses5 libaio-dev
4 ���ڰ�װ����ڵ�Ļ�������ҪԤ�Ȱ�װ���¿�(�˴�Ϊubuntu 20.04): libncurses5 libicu66 python-setuptools gcc
5 ���ڰ�װ��������ҪԤ�Ƚ������Ʒ����� ( percona-8.0.18-bin-rel.tgz, postgresql-11.5-rel.tgz,
   cluster_mgr_rel.tgz ) ���뵱ǰĿ¼. ���⣬�������л����ͽڵ����ڻ��������粻��̫������Ϊ��Ҫ�����������ݵ���Щ�����ϡ�

�ļ�����:
��ǰĿ¼����Ҫ�������ļ�:
 - ���ڰ�װ��������Ҫ�з�����
   percona-8.0.18-bin-rel.tgz��postgresql-11.5-rel.tgz��cluster_mgr_rel.tgz
 - �����ļ�(����install.json),
   ��Ҫ�������ýڵ����ϸ��Ϣ�������ڵ����л�������װ�ڵ����õ��û������Լ��ڵ����е���Ϣ�������ʽ������ϸ˵����
 - ����Ϊ������ص��ļ���ʹ�õĻ��������ǣ��ȸ��������ļ�������ʵ�����е�shell�ű����������иýű�������ɶ�����

�����÷�:
  python2 generate_scripts.py action=install|stop|start|clean config=config_file [defuser=user_to_be_used] [defbase=basedir_to_be_used]
  bash $action/commands.sh   # ����$action=install|stop|start|clean

����generate_scripts.py����, defuser��defbaseΪ��ѡ������

ʾ��:
1 ��װ��Ⱥ:
  python2 generate_scripts.py action=install config=install.json defuser=kunlun
  bash install/commands.sh
2 ֹͣ��Ⱥ:
  python2 generate_scripts.py action=stop config=install.json defbase=.
  bash stop/commands.sh
3 ������Ⱥ:
  python2 generate_scripts.py action=start config=install.json
  bash start/commands.sh
4 ����Ⱥ(ֹͣ��Ⱥ����ɾ�����а�װ�Ľڵ�)
  python2 generate_scripts.py action=clean config=install.json
  bash clean/commands.sh

˵��:
�ù��߼�ʹ��һ��python�ű� 'generate_scripts.py' ��һ��json��ʽ�������ļ�������ʵ�ʵİ�װ��������(commands.sh),
����������Щ�������м��������ָ���Ķ�����

���� action=������ָ����Ҫָ���Ķ�����Ϊinstall, stop, start, clean����֮һ

���� config=�ļ���ָ�������ļ���

���� 'defuser=user_to_be_used'
���ýڵ����ڻ�����ʹ�õ�Ĭ���û����������������(machines������)��û���û��������ã����Ĭ���û�������ʹ�á�
�����ѡ��û�����ã���Ĭ���û���Ϊ���нű����ڻ����ĵ�ǰ�û�����

���� 'defbase=basedir_to_be_used'
���ü�Ⱥ�ڵ�����ڻ�����Ĭ�Ϲ���Ŀ¼���������Ŀ¼û���ڻ���������(machines, ����)�Ļ�����Ĭ��Ŀ¼����ʹ�á�
�����Ĭ��Ŀ¼û������������ָ������'/kunlun'����ΪĬ��Ŀ¼����Ŀ¼�����ڴ�ŷ���������ѹ��ķ�������
�Լ�һЩ�����ļ��͸����ű��ļ��ȡ�

�����ļ�˵��:

���ڲ�ͬ�Ķ������������������ļ�����������ͬ����һ�㶼ʹ��install�����������ļ�������Ŀ¼�ṹ�����أ�Ҫ��start/stop/clean
�����ļ�Ⱥ��Ҳ��ʹ�øù��ߵ�install����������

�����ļ���Ϊ���󲿷֣���ѡ��machines���֣���cluster���֡�
* machines�������ýڵ����ڻ�������Ϣ����Ҫ�������û����ϵ�Ĭ�Ϲ���Ŀ¼, ʹ�õ�Ĭ���û�����
* cluster���������ü�Ⱥ����Ϣ����Ⱥ��Ϣ��Ϊ�岿��
  - name: ��Ⱥ���֣�һ��ʹ����ĸ�����ֵ����
  - meta: Ԫ���ݼ�Ⱥ����Ϣ
  - comp: ����ڵ㼯����Ϣ
  - data: ���ݽڵ㼯����Ϣ
  - clustermgr: ����ڵ����Ϣ(ֻ��Ҫһ��)
* Ԫ���ݼ�ȺΪһ�������飬һ���౸���ڲ�����3����3�����ϵĴ洢�ڵ㡣
* ���ݽڵ㼯Ϊ��������飬һ�������鼴Ϊһ�����ݷ�Ƭ��ÿ���������ڲ�����3����3�����ϴ洢�ڵ㡣
* ����ڵ㼯Ϊһ���������ڵ㣬�ǿͻ��˵Ľ���㡣������ȡ������Ҫ�Ľ������Ŀ��

����ÿ���洢�ڵ㣬����mysql-8.0.18������ һ����Ҫ������Ϣ:
* is_primary:�Ƿ�Ϊ�������еĳ�ʼ���ڵ㣬��install��Ҫ
* ip: �ڵ����ڻ�����ip
* port: mysql port
* xport: mysql xport����install��Ҫ
* mgr_port: ����mysql group replicationͨ�ŵĽڵ㣬��install��Ҫ
* innodb_buffer_pool_size: innodb��buffer pool��С�����Ի�������Сһ�㣬��������һ����Ҫ��һЩ����install��Ҫ
* data_dir_path: mysql����Ŀ¼����install��Ҫ
* log_dir_path: mysql binlog����������־�ȵĴ��λ�ã���install��Ҫ
* user: ����mysql���������̵��û���һ��Ӧ����machines����Ķ�Ӧ��Ŀʹ����ͬ��ֵ����install��Ҫ
* election_weight: mysql group replication��ѡ��Ȩ�ء�һ��50���ɣ���install��Ҫ

����ÿ������ڵ㣬����postgresql-11.5������һ����Ҫ������Ϣ:
* id: ÿ���ڵ��費�ã�һ���1��ʼ����install��Ҫ��
* name: ����, ÿ���ڵ��費ͬ���������Ӽ��ɣ���install��Ҫ��
* ip: �ڵ����ڻ�����IP�����ڿͻ�������
* port: �˿ڣ����ڿͻ�������
* user: �û��������ڿͻ������ӣ���install��Ҫ��
* password: ���룬���ڿͻ������ӣ���install��Ҫ��
* datadir: �ڵ�İ�װĿ¼�����ڴ�Žڵ����ݡ���install��Ҫ��

���ڼ�Ⱥ����ڵ㣬ֻ��Ҫһ����Ϣ:
* ip: �ڵ����ڻ�����IP

�������ÿ��Բ���ʾ��:install.json.

��Ⱥ��װ���������󣬿��������·�ʽ���������Ӻ�ð�̲���:
kunlun@kunlun-test:cluster$ psql -f smokeTest.sql postgres://kunlun:Tx1Df2Mn#@192.168.0.199:5401/postgres
�����û��������룬ip���˿���Ҫ��Ϊ��Ӧ�����ݡ�
