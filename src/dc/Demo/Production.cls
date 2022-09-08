Class dc.Demo.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.Demo.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="File Passthrough Service" Category="" ClassName="EnsLib.File.PassthroughService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="pricelookup" Category="" ClassName="EnsLib.SOAP.GenericService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
