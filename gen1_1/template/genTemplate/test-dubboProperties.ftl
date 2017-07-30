#应用名称
dubbo.application.name=${paramMap.modelName}Provider
#应用作者
dubbo.application.owner=minstone
#zookeeper地址
dubbo.registry.address=${paramMap.providerProjectAddress}
#
dubbo.protocol.name=${paramMap.providerProjectDubboProtocolName}
#注册端口
dubbo.protocol.port=${paramMap.providerProjectPort}
#${paramMap.comment}服务版本
dubbo.service.${paramMap.lowerCaseModelName}.version=1.0.0
#引用缓存服务版本
dubbo.service.cache.version=1.0.0

