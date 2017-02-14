<?php

require_once "services/BookService.php";
require_once "services/EntryService.php";
require_once "services/CommentService.php";
require_once "services/MenuService.php";
require_once "models/Status.php";
require_once "models/Book.php";

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-12
 * Time: 12:12
 */
header("access-control-allow-origin: *");
header('Content-Type: application/json; charset=utf-8');
const json_string = JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES;
$method = $_SERVER["REQUEST_METHOD"];
//$id = $_GET["id"];

switch ($method) {
    case 'GET':
        if (isset($_GET['action'])) {
            $action = $_GET['action'];
            switch ($action) {
                case 'getAllBooks':
                    getAllBooksRequest();
                    break;
                case 'getAllEntries':
                    getAllEntriesRequest();
                    break;
                case 'getEntry':
                    getEntryRequest();
                    break;
                case 'getBook':
                    $id = $_GET['id'];
                    getBookRequest($id);
                    break;
                case 'getMenu':
                    getMenuRequest();
                    break;
            }
        }
        break;
    case 'POST':
        if (isset($_GET['action'])) {
            $action = $_GET['action'];
            switch ($action) {
                case 'addBook':
                    addBookRequest();
                    break;
                case 'addComment':
                    addCommentRequest();
                    break;
                case 'addEntry':
                    addEntryRequest();
                    break;
                default:
                    errorHandler(" Nie można rozpoznać akcji");
                    break;
            }
        } else {
            errorHandler(" Brak zdefiniowanej akcji");
        }
        break;
    case 'DELETE':
        if (isset($_GET["action"])) {
            $action = $_GET["action"];
            switch ($action) {
                case 'deleteBook':
                    deleteBookRequest();
                    break;
                case 'deleteEntry':
                    deleteEntryRequest();
                    break;
                case 'deleteComment':
                    deleteCommentRequest();
                    break;
                default:
                    errorHandler(" Nie można rozpoznać akcji");
                    break;
            }
        } else {
            errorHandler(" Brak zdefiniowanej akcji");
        }
        break;
    case 'PUT':
        if (isset($_GET["action"])) {
            $action = $_GET["action"];
            switch ($action) {
                case 'updateBook':
                    updateBookRequest();
                    break;
                case 'updateEntry' :
                    updateEntryRequest();
                    break;
                default:
                    errorHandler(" Nie można rozpoznać akcji");
                    break;
            }

        } else {
            errorHandler(" Nie można rozpoznać akcji");
        }
    break;
    default:
        errorHandler(" Błąd żądania");
        break;
}

//Book requests
/*
 * Method: GET
 * RequestMapping: /getBook&id
 */

function getBookRequest($id)
{
    $bookService = new BookService();
    $book = $bookService->getBook($id);
    echo json_encode($book,json_string);
}

/*
 * Method: GET
 * RequestMapping: /getAllBooks
 */
function getAllBooksRequest()
{
    $bookService = new BookService();
    $books = $bookService->getAllBooks();

    echo json_encode($books,json_string);
}

/*
 * Method: POST
 * RequestMapping: /addBook
 */
function addBookRequest()
{
    $book = json_decode(file_get_contents('php://input'), true);
    $bookService = new BookService();
    $status = $bookService->addBook($book);

    echo json_encode($status,json_string);
}

/*
 * Method: DELETE
 * RequestMapping /deleteBook?id=
 */
function deleteBookRequest()
{
    $id = $_GET["id"];
    $bookService = new BookService();
    $status = $bookService->deleteBook($id);

    echo json_encode($status,json_string);
}

/*
 * Method: PUT
 * RequestMapping: /updateBook
 */
function updateBookRequest()
{
    $post_vars = null;

    $bookJson = json_decode(file_get_contents('php://input','r'),true);

    $bookService = new BookService();
    $status = $bookService->updateBook($bookJson);

    echo json_encode($status,json_string);
}


//Entry requests
/*
 * Method: GET
 * RequestMapping: /getAllEntries
 */
function getAllEntriesRequest()
{
    $entryService = new EntryService();
    $entries = $entryService->getAllEntries();

    echo json_encode($entries,json_string);
}

/*
 * Method: GET
 * RequestMapping: /getEntry?id=
 */

function getEntryRequest()
{
    if(isset($_GET["id"]))
    {
        $id = $_GET["id"];
        $entryService = new EntryService();
        $entry = $entryService->getEntry($id);
        $commentService = new CommentService();
        $comments = $commentService->getCommentToEntry($id);
        $array = array("entry"=>$entry->toArray(),"comments"=>$comments);

        echo json_encode($array,json_string);
    }
    else
    {
        $status = new Status(0,"Brak podanego id");

        echo json_encode($status->toArray(),json_string);
    }

}

function addEntryRequest()
{
    $entry = json_decode(file_get_contents('php://input'), true);
    $entryService = new EntryService();
    $status = $entryService->addEntry($entry);

    echo json_encode($status,json_string);
}

function deleteEntryRequest()
{
    $id = $_GET["id"];
    $entryService = new EntryService();
    $status = $entryService->deleteEntry($id);

    echo json_encode($status,json_string);
}

function updateEntryRequest()
{
    $entryJson = json_decode(file_get_contents('php://input','r'),true);

    $entryService = new EntryService();
    $status = $entryService->updateEntry($entryJson);

    echo json_encode($status,json_string);

}

function addCommentRequest()
{
    $commentJson = json_decode(file_get_contents('php://input','r'),true);

    $commentService = new CommentService();
    $status = $commentService->addComment($commentJson);

    echo json_encode($status,json_string);

}

function deleteCommentRequest()
{
    $id = $_GET["id"];
    $commentService = new CommentService();
    $status = $commentService->deleteComment($id);

    echo json_encode($status,json_string);
}



/*
 * Method: GET
 * RequestMapping: /getMenu
 */
function getMenuRequest()
{
    $menuService = new MenuService();
    $menu = $menuService->getMenuItems();

    echo json_encode($menu,json_string);
}

function errorHandler($message)
{
    $status = new Status(0,"Nie można rozpoznać żądania\n".$message);
    $ret = $status->toArray();
    echo json_encode($ret,json_string);
}

