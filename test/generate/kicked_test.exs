defmodule CWMP.Protocol.Generator.KickedTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Kicked>
\t\t\t<Command>Command</Command>
\t\t\t<Referer>some_host</Referer>
\t\t\t<Arg>foo</Arg>
\t\t\t<Next>http://example.com/next</Next>
\t\t</cwmp:Kicked>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates full Kicked request" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.Kicked{
        command: "Command",
        referer: "some_host",
        arg: "foo",
        next: "http://example.com/next"}) == @sample)
  end

end
