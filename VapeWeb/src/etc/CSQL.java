package etc;

public class CSQL {
    public String[] generateSQLQuery(String getproducttype, String orderbyproducttype, String orderbyString, String searchsql) {
		String[] strAry = new String[3];
		if(getproducttype == null) {
			orderbyproducttype = "select * from products order by price DESC";
		} else {
			if(orderbyString != null) {
				orderbyproducttype = "select * from products order by price DESC";
			}
			
			if(orderbyString.equals("1")) {
				orderbyproducttype = "select * from products  where producttype = '" + getproducttype + "'" + "order by price DESC";
			}
			if(orderbyString.equals("2")) {
				orderbyproducttype = "select * from products  where producttype = '" + getproducttype + "'" + "order by price ASC";
			} 
			if(orderbyString.equals("3")) {
				orderbyproducttype = "select * from products  where producttype = '" + getproducttype + "'" + "order by adddate ASC";
			}
            if(getproducttype.equals("search") && orderbyString.equals("1")) {
                orderbyproducttype = "select * from products where pname Like '%"+searchsql+"%'" + "order by price DESC";
            }
            if(getproducttype.equals("search") && orderbyString.equals("2")) {
                orderbyproducttype = "select * from products where pname Like '%"+searchsql+"%'" + "order by price ASC";
            }
            if(getproducttype.equals("search") && orderbyString.equals("3")) {
                orderbyproducttype = "select * from products where pname Like '%"+searchsql+"%'" + "order by adddate ASC";
            }
		}
		strAry[0] = orderbyproducttype;
		strAry[1] = getproducttype;
		strAry[2] = orderbyString;
		return strAry;
	}
}
