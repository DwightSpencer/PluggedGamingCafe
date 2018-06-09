 <?php

if(isset($_POST['search']))
{
    $valueToSearch = $_POST['valueToSearch'];
    // search in all table columns
    // using concat mysql function
    $query = "SELECT order_details.quantity, order_details.order_id, order_details.description, order_details.price, order_details.ordered_date, users.username
FROM order_details INNER JOIN users ON order_details.user_id = users.id WHERE CONCAT(order_details.quantity, order_details.id, order_details.order_id, order_details.price, order_details.ordered_date, users.username) LIKE '%".$valueToSearch."%'";
    $search_result = filterTable($query);
    
}
 else {
    $query = "SELECT * FROM `order_details`";
    $search_result = filterTable($query);
}

// function to connect and execute the query
function filterTable($query)
{
    $connect = mysqli_connect("localhost", "root", "", "pluggedcafe");
    $filter_Result = mysqli_query($connect, $query);
    return $filter_Result;
}

?>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <style>
            table,tr,th,td
            {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>

      
        <form action="sales-transaction" method="post">
            <input type="text" name="valueToSearch" placeholder="Value To Search"><br><br>
            <input type="submit" name="search" value="Filter"><br><br>
            
            <table class="table table-bordered" cellspacing="0" width="100%">
                 <tr>
                    <th>Quantity</th>
                    <th>Invoice ID #</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Ordered Date</th>
                    <th>Cashier #</th>
                </tr>

      <!-- populate table from mysql database -->
                <?php while($row = mysqli_fetch_array($search_result)):?>
                 <tr>
                    <td><?php echo $row['quantity'];?></td>
                    <td><?php echo $row['order_id'];?></td>
                    <td><?php echo $row['description'];?></td>
                    <td><?php echo $row['price'];?></td>
                    <td><?php echo $row['ordered_date'];?></td>
                    <td><?php echo $row['user_id'];?></td>
                </tr>
                <?php endwhile;?>
            </table>
        </form>
        
    </body>
</html>