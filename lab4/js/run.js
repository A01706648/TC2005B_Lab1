//Question 1
const input_num = prompt("enter one number please!");
//output
document.write("<h1>1</h1>");
document.write("<table><tbody>");
document.write("<tr><th>number</th><th>squares</th><th>cubes</th></tr>");
for(let count = 1; count <= input_num; count ++)
{
    document.write("<tr><td>" + count + "</td>");
    document.write("<td>" + (count * count) + "</td>");
    document.write("<td>" + (count * count * count) + "</td></tr>");
}
document.write("</tbody></table>")

//Question 2
const random_1 = Math.floor((Math.random() * 100));
const random_2 = Math.floor((Math.random() * 100));
const input_sum = prompt("enter the answer of " + random_1 + " + " + random_2);

document.write("<h1>2</h1>");
if(input_sum == (random_1 + random_2))
{
    document.write("<h2>Answer is Correct<h2>");
}
else
{
    document.write("<h2>Answer is Wrong<h2>");
}

//Question 3
document.write("<h1>3</h1>");
function counter_result(pos, zero, neg)
{
    this.pos = pos;
    this.zero = zero;
    this.neg = neg;
}

function counter(array_var)
{
    let neg_count = 0;
    let zero_count = 0;
    let pos_count = 0;
    let count = 0;
    for(count = 0; count < array_var.length; count ++)
    {
        if(array_var[count] < 0)
        {
            neg_count ++;
        }
        else if(array_var[count] > 0)
        {
            pos_count ++;
        }
        else
        {
            zero_count ++;
        }
    }

    return new counter_result(pos_count, zero_count, neg_count);
}

let test_array = new Array(0, 1, -1, 2, -2, 3, -3);
let result_of_count = counter(test_array);
document.write("pos " + result_of_count.pos + ";zero " + result_of_count.zero + ";neg " + result_of_count.neg);


//Question 4
function averages(matrix)
{
    let avarage_lines = [];
    let row_count = 0;
    let col_count = 0;
    let sum = 0;

    for(row_count = 0; row_count < matrix.length; row_count ++)
    {
        sum = 0;
        for(row_count = 0; row_count < matrix[row_count].length; row_count ++)
        {
            sum = sum + matrix[row_count][col_count];
        }

        avarage_lines.push(sum / matrix[row_count].length);
    }

    return avarage_lines;
}

let test_matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [10,11,12]];
let avarage_lines = averages(test_matrix);
