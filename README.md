# Examples

## Open a Console

```
./console
```

## Make a connection

```
conn = Provider::Openshift::Connection.new('7yvEIvdF5yn2dGR2lJLqeHVHS26VBkO-zzpzpBiSfu8','https://172.16.2.130:8443')
```

## Get all Catalog Items

```
conn.k8s.catalog_items.all
```

## Find a specific Catalog Item

```
conn.k8s.catalog_items.find('ca91b61da8476984f18fc13883ae2fdb')
```

## Get all Catalog Plans

```
conn.k8s.catalog_plans.all
```

## Find a specific Catalog Plans

```
conn.k8s.catalog_plans.find('b2bba601df39d5774c2313bc716981e0')
```

## Find all Plan Parameters

```
conn.k8s.plan_parameters.all
```

## Find a specific Plan Parameters

```
conn.k8s.plan_parameters.find("b2bba601df39d5774c2313bc716981e0")
```

## Lookup all dynamic Kubeclient CRUD methods

```
 pp (conn.k8s.instance.methods - Object.methods).sort.grep(/service_instance/)
[:create_service_instance,
 :delete_service_instance,
 :get_service_instance,
 :get_service_instances,
 :patch_service_instance,
 :update_service_instance,
 :watch_service_instances]
 => [:create_service_instance, :delete_service_instance, :get_service_instance, :get_service_instances, :patch_service_instance, :update_service_instance, :watch_service_instances]
```
