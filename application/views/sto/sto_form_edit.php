<section class="content-header">
  <h1>
    STO
    <small>Data STO</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i></a></li>
    <li class="active">STO</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">

  <div class="box">
      <div class="box-header">
        <h3 class="box-title">Edit STO</h3>
        <div class="pull-right">
            <a href="<?=site_url('Admin/getSTO')?>" class="btn btn-warning btn-flat">
                <i class="fa fa-undo"></i> Back 
            </a>
        </div>
      </div>
      <div class="box-body">
         <div class="row">
             <div class="col-md-4 col-md-offset-4">
                <form action="" method="post"> 
                    <div class="form-group <?=form_error('kodeSTO') ? 'has-error' : null?>">
                        <label>Kode STO *</label>
                        <input type="hidden" name="idSTO" value="<?=$row->idSTO?>">
                        <input type="text" name="kodeSTO" value="<?=$this->input->post('kodeSTO') ?? $row->kodeSTO?>" class="form-control" placeholder="Format ex: SMC"> 
                        <?=form_error('kodeSTO')?>
                    </div>
                    
                    <div class="form-group <?=form_error('namaSTO') ? 'has-error' : null?>">
                        <label>Nama STO *</label>
                        <input type="text" name="namaSTO" value="<?= $this->input->post('namaSTO') ?? $row->namaSTO?>" class="form-control">
                        <?=form_error('namaSTO')?>
                    </div>
                    <div class="form-group <?=form_error('keterangan') ? 'has-error' : null ?>">
                            <label>Keterangan</label>
                            <textarea name="keterangan" class="form-control" rows="3"><?php echo $this->input->post('keterangan') ?? $row->keterangan?></textarea>
                            <?=form_error('keterangan')?>
                    </div>
                    <div class="form-group <?=form_error('datel') ? 'has-error' : null ?>">
                        <label>Datel *</label>
                        <?php
                        $query = $this->Datel_model->getAllDatel();
                            foreach ($query->result() as $key => $datel) {
                                $listdatel[] = $datel;
                            }
                           
                             print_r($query->result()) ;
                        ?>
                          
                       
                        
                        <select name="datel" class="form-control">
                          <option value=""><?php
                            
                          ?>
                            
                          </option>
                        </select>
                        
                        
                        
                        <?=form_error('datel')?>
                    </div>
                    <div class="form-group">
                        <button name="submit" type="submit" class="btn btn-success btn-flat">
                            <i class="fa fa-paper-plane"></i> Simpan
                        </button>
                        <button type="reset" class="btn btn-flat">Reset</button>
                    </div>
                </form>
             </div>
         </div>
      </div>
  </div>

</section>
