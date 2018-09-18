defmodule CWMP.Protocol.Generator.RequestDownloadTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:RequestDownload>
      <FileType>2 Web Content</FileType>
      <FileTypeArg SOAP-ENC:arrayType="cwmp:ArgStruct[1]">
        <ArgStruct>
          <Name>Version</Name>
          <Value>v2.0</Value>
        </ArgStruct>
      </FileTypeArg>
    </cwmp:RequestDownload>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates RequestDownload request" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.RequestDownload{
        filetype: "2 Web Content",
        filetype_arg: [
          %CWMP.Protocol.Messages.ArgStruct{
            name: "Version",
            value: "v2.0"}
        ]}) == @sample)
  end

end
