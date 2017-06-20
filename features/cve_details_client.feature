Feature: Command gets new CVE details from cvedetails

  Scenario: App gets new vulnerabilities from cvedetails
    Given a file named "cvetest" with:
    """
      {
        "cve_id": "CVE-2017-3733",
        "update_date": "2017-05-08"
      }
    """
    When I run `cve_details_client openssl cvetest`
    Then the exit status should be 0
    Then the output should contain "CVE"

  Scenario: App should get no new vulnerabilities from cvedetails
    Given a file named "cvetest" with:
    """
      {
        "cve_id": "CVE-2017-3733",
        "update_date": "2050-05-08"
      }
    """
    When I run `cve_details_client openssl cvetest`
    Then the exit status should be 0
    Then the output should not contain "CVE"
