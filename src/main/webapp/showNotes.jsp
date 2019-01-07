<%@ page contentType="text/html" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.21/vue.min.js"></script>
        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container" id="app">
            <a href="index.jsp">Main</a><br/>
            <button class="btn btn-primary" v-on:click='add();'>ADD</button>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <!--
                    將 notes 綁定到表格上，分別呈現 id, title, date (10%)
                    -->
                    <tr  v-for="note in notes">
                        <td>{{note.id}}</td>
                        <td>{{note.title}}</td>
                        <td>{{note.date}}</td>
                        <td>
                            <!--
                            將 click 綁到 vue 的 edit(note); (10%)
                            -->
                            <button class="btn btn-primary" v-on:click="edit(note);">EDIT</button>
                            <button class="btn btn-danger" v-on:click='deleteNote(note);'>DELETE</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="inputModal" tabindex="-1" role="dialog" 
             aria-labelledby="inputModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="inputModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--
                        將底下欄位分別綁定到 vue 的
                        note.header.id
                        note.header.title
                        note.header.date
                        note.content
                        要用可編輯的方式 (10%)
                        -->
                        ID: <input class="form-control" type='text' v-model="note.header.id"></input>
                        Title: <input class="form-control" type='text' v-model="note.header.title"></input>
                        Date: <input class="form-control" type='date' v-model="note.header.date"></input>
                        Content: <textarea class="form-control" rows='3' v-model="note.content"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" v-on:click="save(note);">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script>
            var model = null;
            var editTypeAdd = true;
            var dlgModel = new Vue({
                el: "#inputModal",
                data: {
                    note: {
                        header: {
                            id: "",
                            title: "",
                            date: ""
                        },
                        content: ""
                    }
                },
                methods: {
                    save: function (note) {
                        if (editTypeAdd) {
                            $.ajax("webapi/note", {
                                type: "POST",
                                data: JSON.stringify(note),
                                contentType: "application/json",
                                success: function () {
                                    $('#inputModal').modal('hide');
                                    loadNoteList();
                                }
                            });
                        }else{
                            $.ajax("webapi/note", {
                                type: "PUT",
                                data: JSON.stringify(note),
                                contentType: "application/json",
                                success: function () {
                                    $('#inputModal').modal('hide');
                                    loadNoteList();
                                }
                            });
                        }
                    }
                }
            });

            function loadNoteList() {
                $.ajax("webapi/notes", {
                    success: function (data) {
                        if (model != null) {
                            model.notes = data;
                        } else {
                            model = new Vue({
                                el: "#app",
                                data: {
                                    notes: data
                                },
                                methods: {
                                    edit: function (noteHeader) {
                                        editTypeAdd = false;
                                        $.ajax("webapi/note/"+noteHeader.id, {
                                            success: function(data){
                                                dlgModel.note=data;
                                                $('#inputModal').modal('show');
                                            }
                                        });
                                    },
                                    add: function () {
                                        editTypeAdd = true;
                                        dlgModel.note.header.id = "";
                                        dlgModel.note.header.title = "";
                                        dlgModel.note.header.date = "";
                                        dlgModel.note.content = "";
                                        $('#inputModal').modal('show');
                                    },
                                    deleteNote: function(noteHeader){
                                        $.ajax("webapi/note/"+noteHeader.id, {
                                            type:"DELETE",
                                            success: function(){
                                                loadNoteList();
                                            }
                                        });
                                    }
                                }
                            });
                        }
                    }
                });
            }
            loadNoteList();
        </script>
    </body>
</html>