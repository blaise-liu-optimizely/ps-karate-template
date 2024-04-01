function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'prep';
  }
  var config = {
    env: env,
    apiUrl:{
      'admincenter_host':'http://127.0.0.1:7262',
      'webhook_host':'http://127.0.0.1:7247'
    },
    login:{
      domain:'https://prep.login.optimizely.com',
      username:'jianqing.liu+lt2@optimizely.com',
      password:'LT2@2024Cafe',
      client_id:'0oa949m8pgVAqKhcc1d7',
      scope:'openid  profile email idx_instancepermissions'
    }
  }
  if (env == 'inte') {
    config.apiUrl.admincenter_host = 'https://inte.usermgmt-api.optimizely.com';
    config.apiUrl.webhook_host = 'https://inte.identity-api.optimizely.com';
    config.login.username='jianqing.liu+lt2@optimizely.com';
    config.login.password='LT2@2024Cafe';
    config.login.client_id='0oa949m8pgVAqKhcc1d7'
  } else if (env == 'prep') {
    config.apiUrl.admincenter_host = 'https://prep.usermgmt-api.optimizely.com';
    config.apiUrl.webhook_host = 'https://prep.identity-api.optimizely.com';
    config.login.username='jianqing.liu+lt2@optimizely.com';
    config.login.password='LT2@2024Cafe';
    config.login.client_id='0oa949m8pgVAqKhcc1d7'
  } else if (env == 'prod') {
    config.apiUrl.admincenter_host = 'https://usermgmt-api.optimizely.com';
    config.apiUrl.webhook_host = 'https://identity-api.optimizely.com';
    config.login.username='jianqing.liu+lt2@optimizely.com';
    config.login.password='LT2@2024Cafe';
    config.login.client_id='0oa949m8pgVAqKhcc1d7'
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}