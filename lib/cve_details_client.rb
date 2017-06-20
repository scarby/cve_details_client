require "cve_details_client/version"
require 'net/http'
require 'uri'
require 'nokogiri'
require 'json'
require 'date'

module CveDetailsClient

  def self.getProduct(productName)
  productSearchUri = URI.parse("http://www.cvedetails.com/product-search.php?vendor_id=0&search=#{productName}")
  products = Net::HTTP.get_response(productSearchUri)
  productsHTML = Nokogiri::HTML(products.body)
  if !productsHTML.search('.listtable .errormsg').empty?
    puts ("no product matching the search term #{productName} was found")
    return false
  end
  productURI = productsHTML.search('.listtable .num a')[0]
  href = productURI.attributes['href'].to_s
  vendor_product = href.scan(/\d+/)
  vendor_id  = href.scan(/\d+/)[0]
  product_id = href.scan(/\d+/)[1]
  productHash = a = {'vendor' => vendor_id, 'product' => product_id}
  return productHash
end

def self.getCVElist(vendor, product)
   cveUri = URI.parse("http://www.cvedetails.com/json-feed.php?numrows=30&vendor_id=#{vendor}&product_id=#{product}")
   cveResp = Net::HTTP.get_response(cveUri)
   cveJson = JSON.parse(cveResp.body)
   return cveJson
end

def self.getLastCve(file)
  if File.file?(file)
    content = File.read(file)
  else
    content = {'cve_id' => nil, 'update_date' => Date.today.iso8601 }
    return content
  end
  content = JSON.parse(content)
  return content
end

def self.setLastCve(file, hash)
  content = JSON.pretty_generate(hash)
  File.write(file, content)
end

def self.getNewCve(cvesJson,date)
  newCve = []
  date = Date.iso8601(date)
  cvesJson.each do |cve|
    update_date = Date.iso8601(cve['update_date'])
    if update_date > date
      newCve.push(cve)
    end
  end
  return newCve
end

def self.emailCVEList(cveJson,email)
  puts JSON.pretty_generate(cveJson)
end

end
