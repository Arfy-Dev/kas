<?php
require 'connection.php';
checkLogin();
$siswa = mysqli_query($conn, "SELECT * FROM siswa ORDER BY nama_siswa ASC");
if (isset($_POST['btnEditSiswa'])) {
  if (editSiswa($_POST) > 0) {
    setAlert("Mahasiswa has been changed", "Successfully changed", "success");
    header("Location: siswa.php");
  }
}

if (isset($_POST['btnTambahSiswa'])) {
  if (addSiswa($_POST) > 0) {
    setAlert("Mahasiswa has been added", "Successfully added", "success");
    header("Location: siswa.php");
  }
}
if (isset($_GET['toggle_modal'])) {
  $toggle_modal = $_GET['toggle_modal'];
  echo "
    <script>
      $(document).ready(function() {
        $('#$toggle_modal').modal('show');
      });
    </script>
    ";
}
?>

<!DOCTYPE html>
<html>

<head>
  <?php include 'include/css.php'; ?>
  <title>Mahasiswa</title>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">

    <?php include 'include/navbar.php'; ?>

    <?php include 'include/sidebar.php'; ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row justify-content-center mb-2">
            <div class="col-sm text-left">
              <h1 class="m-0 text-dark">Mahasiswa</h1>
            </div><!-- /.col -->
            <div class="col-sm text-right">
              <?php if ($_SESSION['id_jabatan'] !== '3') : ?>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tambahSiswaModal"><i class="fas fa-fw fa-plus"></i> Tambah Mahasiswa</button>
                <!-- Modal -->
                <div class="modal fade text-left" id="tambahSiswaModal" tabindex="-1" role="dialog" aria-labelledby="tambahSiswaModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <form method="post">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="tambahSiswaModalLabel">Tambah Mahasiswa</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <div class="form-group">
                            <label for="nama_siswa">Nama Mahasiswa</label>
                            <input type="text" id="nama_siswa" name="nama_siswa" class="form-control" required>
                          </div>
                          <div class="form-group">
                            <label>Jenis Kelamin</label><br>
                            <input type="radio" id="pria" name="jenis_kelamin" value="pria"> <label for="pria">Pria</label> |
                            <input type="radio" id="wanita" name="jenis_kelamin" value="wanita"> <label for="wanita">Wanita</label>
                          </div>
                          <div class="form-group">
                            <label for="no_telepon">No. Telepon</label>
                            <input type="tel" name="no_telepon" pattern="^\d{12}$" id="no_telepon" required class="form-control">
                          </div>

                          <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" required name="email" id="email" class="form-control">
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-fw fa-times"></i> Close</button>
                          <button type="submit" class="btn btn-primary" name="btnTambahSiswa"><i class="fas fa-fw fa-save"></i> Save</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              <?php endif ?>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg">
              <div class="table-responsive">
                <table class="table table-striped table-hover table-bordered" id="table_id">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Nama Mahasiswa</th>
                      <th>Jenis Kelamin</th>
                      <th>No. Telepon</th>
                      <th>Email</th>
                      <?php if ($_SESSION['id_jabatan'] !== '3') : ?>
                        <th>Aksi</th>
                      <?php endif ?>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $i = 1; ?>
                    <?php foreach ($siswa as $ds) : ?>
                      <tr>
                        <td><?= $i++; ?></td>
                        <td><?= ucwords(htmlspecialchars_decode($ds['nama_siswa'])); ?></td>
                        <td><?= ucwords($ds['jenis_kelamin']); ?></td>
                        <td><?= $ds['no_telepon']; ?></td>
                        <td><?= $ds['email']; ?></td>
                        <?php if ($_SESSION['id_jabatan'] !== '3') : ?>
                          <td>
                            <!-- Button trigger modal -->
                            <a href="ubah_siswa.php?id_siswa=<?= $ds['id_siswa']; ?>" class="badge badge-success" data-toggle="modal" data-target="#editSiswa<?= $ds['id_siswa']; ?>">
                              <i class="fas fa-fw fa-edit"></i> Ubah
                            </a>
                            <!-- Modal -->
                            <div class="modal fade" id="editSiswa<?= $ds['id_siswa']; ?>" tabindex="-1" role="dialog" aria-labelledby="editSiswa<?= $ds['id_siswa']; ?>" aria-hidden="true">
                              <div class="modal-dialog" role="document">
                                <form method="post">
                                  <input type="hidden" name="id_siswa" value="<?= $ds['id_siswa']; ?>">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="editSiswaModalLabel<?= $ds['id_siswa']; ?>">Ubah Mahasiswa</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                    <div class="modal-body">
                                      <div class="form-group">
                                        <label for="nama_siswa<?= $ds['id_siswa']; ?>">Nama Mahasiswa</label>
                                        <input type="text" id="nama_siswa<?= $ds['id_siswa']; ?>" value="<?= $ds['nama_siswa']; ?>" name="nama_siswa" class="form-control" required>
                                      </div>
                                      <div class="form-group">
                                        <label>Jenis Kelamin</label><br>
                                        <?php if ($ds['jenis_kelamin'] == 'pria') : ?>
                                          <input type="radio" id="pria<?= $ds['id_siswa']; ?>" name="jenis_kelamin" value="pria" checked="checked"> <label for="pria<?= $ds['id_siswa']; ?>">Pria</label> |
                                          <input type="radio" id="wanita<?= $ds['id_siswa']; ?>" name="jenis_kelamin" value="wanita"> <label for="wanita<?= $ds['id_siswa']; ?>">Wanita</label>
                                        <?php else : ?>
                                          <input type="radio" id="pria<?= $ds['id_siswa']; ?>" name="jenis_kelamin" value="pria"> <label for="pria<?= $ds['id_siswa']; ?>">Pria</label> |
                                          <input type="radio" id="wanita<?= $ds['id_siswa']; ?>" name="jenis_kelamin" value="wanita" checked="checked"> <label for="wanita<?= $ds['id_siswa']; ?>">Wanita</label>
                                        <?php endif ?>
                                      </div>
                                      <div class="form-group">
                                        <label for="no_telepon<?= $ds['id_siswa']; ?>">No. Telepon</label>
                                        <input type="tel" name="no_telepon" pattern="^\d{12}$" value="<?= $ds['no_telepon']; ?>" id="no_telepon<?= $ds['id_siswa']; ?>" required class="form-control">
                                      </div>

                                      <div class="form-group">
                                        <label for="email<?= $ds['id_siswa']; ?>">Email</label>
                                        <input type="email" name="email" value="<?= $ds['email']; ?>" id="email<?= $ds['id_siswa']; ?>" required class="form-control">
                                      </div>
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-fw fa-times"></i> Close</button>
                                      <button type="submit" class="btn btn-primary" name="btnEditSiswa"><i class="fas fa-fw fa-save"></i> Save</button>
                                    </div>
                                  </div>
                                </form>
                              </div>
                            </div>
                            <?php if ($_SESSION['id_jabatan'] == '1') : ?>
                              <a data-nama="<?= $ds['nama_siswa']; ?>" class="btn-delete badge badge-danger" href="hapus_siswa.php?id_siswa=<?= $ds['id_siswa']; ?>"><i class="fas fa-fw fa-trash"></i> Hapus</a>
                            <?php endif ?>
                          </td>
                        <?php endif ?>
                      </tr>
                    <?php endforeach ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
      <strong>Copyright &copy; 2023 By Kelompok 4.</strong>
      All rights reserved.
      <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 1.0.0
      </div>
    </footer>

  </div>
  <script>
    var radioButtons = document.getElementsByName("jenis_kelamin");
    var radiosChecked = false;

    for (var i = 0; i < radioButtons.length; i++) {
      radioButtons[i].addEventListener("change", function() {
        radiosChecked = true;
      });
    }

    // Menambahkan event listener untuk menghentikan pengiriman formulir jika radio tidak terpilih
    document.querySelector("form").addEventListener("submit", function(event) {
      if (!radiosChecked) {
        alert("Harap pilih salah satu jenis kelamin.");
        event.preventDefault(); // Mencegah pengiriman formulir
      }
    });
  </script>

  <script>
    document.addEventListener("input", function(e) {
      if (e.target && e.target.name === "nama_siswa") {
        const inputValue = e.target.value;
        const isValid = /^[A-Za-z. ]+$/.test(inputValue);

        if (!isValid) {
          alert("Input hanya boleh mengandung huruf, spasi, dan titik.");
          e.target.value = e.target.value.replace(/[^A-Za-z. ]/g, "");
        }
      }
    });
  </script>



</body>

</html>