# frozen_string_literal: true

require 'csv'

module Dashboard
  class UploadCsv
    def initialize(csv)
      @csv = csv
    end

    def self.call(csv)
      new(csv).call
    end

    def call
      import_init
    end

    private

    def import_init
      dir_path = create_directory

      get_file(dir_path)
      import_csv_data(dir_path)

      true
    rescue StandardError
      false
    end

    def create_directory
      time_now = Time.now.strftime('%Y%m%d%H%M%S')

      csv_dir = FileUtils.mkdir_p("tmp/csv/#{time_now}/")
      csv_dir[0] + @csv.original_filename
    end

    def get_file(dir_path)
      File.open(dir_path, 'wb') do |file|
        file.write(@csv.read)
      end
    end

    def import_csv_data(folder_path)
      CSV.foreach(folder_path, headers: true, encoding: 'bom|utf-8', col_sep: ';') do |row|
        next if row['sgUF'] != 'SC'

        ActiveRecord::Base.transaction do
          deputy = find_or_create_deputy!(row)
          create_cost!(row, deputy)
        end
      end
    end

    def find_or_create_deputy!(row)
      Deputy.find_or_create_by!(
        txNomeParlamentar: row['txNomeParlamentar'],
        ideCadastro: row['ideCadastro'],
        nuCarteiraParlamentar: row['nuCarteiraParlamentar'],
        cpf: row['cpf'],
        sgUF: row['sgUF'],
        sgPartido: row['sgPartido']
      )
    end

    def create_cost!(row, deputy)
      Cost.find_or_create_by!(
        txtDescricao: row['txtDescricao'],
        txtFornecedor: row['txtFornecedor'],
        txtCNPJCPF: row['txtCNPJCPF'],
        datEmissao: row['datEmissao'],
        vlrLiquido: row['vlrLiquido'],
        urlDocumento: row['urlDocumento'],
        deputy: deputy,
        created_at: Time.now.utc,
        updated_at: Time.now.utc
      )
    end
  end
end