module CustomersHelper
  def short_description(customer)
  if customer.description.index("</p>")
        indx1=customer.description.index("</p>")+4
        str=customer.description[indx1,customer.description.length]
        if str.index("</p>")
          short_description=customer.description[0,indx1+str.index("</p>")+4]
        else
          short_description=customer.description
        end
   else
        short_description=customer.description
   end
   return short_description
   end
end
