Feature: Command gets new CVE details from cvedetails

  Scenario: App gets new vulnerabilities for OpenSSL from cvedetails
    Given a file named "cvetest" with:
    """
      {
        "cve_id": "CVE-2017-3733",
        "update_date": "2017-05-08"
      }
    """
    When I run `cve_details_client openssl cvetest`
    Then the exit status should be 0
    And the output should contain "CVE"
    And the output should contain "OpenSSL"

  Scenario: App should get no new vulnerabilities from cvedetails
    Given a file named "cvetest" with:
    """
      {
        "cve_id": "CVE-2017-3733",
        "update_date": "2050-05-08"
      }
    """
    When I run `cve_details_client openvpn cvetest`
    Then the exit status should be 0
    And the output should not contain "CVE"

    Scenario: App gets new vulnerabilities for openvpn from cvedetails
      Given a file named "cvetest" with:
      """
        {
          "cve_id": "CVE-2017-3733",
          "update_date": "2017-05-08"
        }
      """
      When I run `cve_details_client openvpn cvetest`
      Then the exit status should be 0
      And the output should contain "CVE"
      And the output should contain "OpenVPN"
