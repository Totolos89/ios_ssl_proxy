## When performing post to https://albert.apple.com/deviceservices/deviceActivation From the actual device, when performing the activation step, the request body will have a plist containing ActivationInfoXML, FairPlayCertChain, FairPlaySignature, and these fields which I haven't seen before:

        <key>RKCertification</key>
        <data>
        MIICDTCCAbICAQEwGKIWBBQ4OTYwLTViNjhiMTZmNmQ4LWQtMDCB2QIBATAKBggqhkjO
        PQQDAgNHADBEAiBmgG3BA0qgY9VeGnlLrDooCgcqBwvDVy6V7x2BzXfAagIgSVcq/SPK
        tAAgFsDycifOvO7l4M8gwB57SSj9UaHQNm4wWzAVBgcqhkjOPQIBoAoGCCqGSM49AwEH
        A0IABGgWJjc6GUbKWYLu+ARstvtCqJPzduZZWOkc8V0s2ulXJUe23M7OWcajoRorTpdx
        eej61EjmdT0QQk7rqLcH0UugCgQIIHNrc0gAAACiFgQUmQtDhlCeVVZeDLPdhkUjwoLW
        zCQwgbYCAQEwCgYIKoZIzj0EAwIDSAAwRQIgCn7emlYvh2b/IIzUN4OV3N4eoZGQqLuA
        Y0bpY4OzMdgCIQCEtwbLHZtb5TKz9jQAeR4chJKky/KHfOJ7xzx6LFQb2DBbMBUGByqG
        SM49AgGgCgYIKoZIzj0DAQcDQgAEgTYJ8o10XWfbcWKEfkJqSo8UXVecA71Te8W1z/oO
        bGhZxn+isIZdKWcZdz5RN2Skuuvf4RiJ+0OEO5nhivbFKDAKBggqhkjOPQQDAgNJADBG
        AiEA5XESVTorRaRDiuEEXJXJOdprPVUgqooLOO7bRwTpNUUCIQD0X91qmU45c4GQlPhR
        Y8/HmwxN7sZwKP//gz+k8S47sQ==
        </data>
        <key>RKSignature</key>
        <data>
        MEUCIDao9luc7C1qwE7dKKrWnDrmCoZm/RArQ1nfGz5co3kOAiEAzI50iDtIedoJV7nq
        pUueKTHKepb81JyUBltvv+ijgY4=
        </data>
        <key>serverKP</key>
        <data>
        A2B7l6rqE/aSQIAroCW7aHsO/N3+7hVXSspEyYp/zOUMnNd2UJsCVragRHY21T7xpij5
        5CeVB3lOYEdQaGHdQfXdu9js
        </data>
        <key>signActRequest</key>
        <data>
        LDVntEqDZU1NBd/mzQzcnQ==
        </data>

## Also saw this request packet which seems to occur every time before posting to deviceActivation:

	POST https://albert.apple.com/deviceservices/drmHandshake
	Content-Type: application/xml
	X-iOS-Activation-Medium: WiFi
	Accept: application/xml
	Accept-Language: en-us
	User-Agent: iOS Device Activator (MobileActivation-182.30.16 built on Dec 15 2016 at 22:54:03)
	Content-length: 526
	Host: albert.apple.com
	Accept-Encoding: gzip, deflate
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>FDRBlob</key>
		<data>
		uNAFArLlnmDdTqW1pgGHIlAxq5EdQrCI/w2kvzRzPjAHQLSX3b+DwlHXSpB3P5C0LHCl
		R3de2u8J7VKQF7iOxzecXmZa5HNFDjQ4Vmn4f3h1l9rg4Y6qHZQBfh4JvpgW
		</data>
		<key>HandshakeRequestMessage</key>
		<data>
		AmbIBUIa2Zw8jMmtkryQ1BrYbC7y
		</data>
		<key>UniqueDeviceID</key>
		<string>a64badc34879619f66b56d5c90170ef1ae73b1da</string>
	</dict>
	</plist>
	
	HTTP/1.1 200 OK
	Server: Apache-Coyote/1.1
	Cache-Control: private, no-cache, no-store, must-revalidate, max-age=0
	Content-Type: application/xml
	Content-Length: 866
	Date: Fri, 10 Feb 2017 17:50:07 GMT
	<plist version="1.0"><dict><key>HandshakeResponseMessage</key><data>AqVGksjBfLV1XbdqNIu8k+CmYgtut/9qsfV4/H1e5Y+DKWYUAMdzO/92Sxk8lTMT3tKfVcDCoK0Awjb2qNvBBqgBoDZ/cNfRCocUwMRXe01mBVj1yXkE+vo9dXYhzJ1UykxAoSrgccH2VGxaG41g8CWoymt5sz0hpWpgLj+07V+5ku+dTKEZ1caRzfXD44H0EEY5GEVC9Mt654/8WjE6jAnzsNnlAGBszD4EbWMOkf/y3HsN9asDFBRkJIJRB5dE0J/k86cEWor7QrUg2xOCt3brQ3IQ79ByI9VaRxYq8HF8U3gBrewYI9jtBj7yfi9LM86ZtwgfNFcksh8FZT+iurmkJE3cWSRZKTuXUy3kFl5ui38sATMHuhk1yzv7mMnDa7pCNXsjn4P3y3v2Y0KiI7Kr0i4SxbVW0Ecsk9U04Tb7DulAGmeTRKE1UMornfOTL23jqUf2PqXbnOsV7UBL8ser3TEazzo/0kWJ7e1c+/pgemp4EbphT+C7/yn4wbG1M0swCjgnpqRaeeCu3diPNoKYDoRiIFoOjcn3X7Ca4u1ry7lDlt1ZChb2WFTLOjhkd76NZePZAaeH/DM+Gzd1aJEkv2vdzRhT8bkScOo+LdMYQaZsDGwVZosnFaDVew0vc0LnAAoAAYI=</data><key>serverKP</key><data>A2B7l6rqE/aSQIAroCW7aHsO/N3+7hVXSspEyYp/zOUMnNd2UJsCVragRHY21T7xpij55CeVB3lOYEdQaGHdQfXdu9js</data></dict></plist>
