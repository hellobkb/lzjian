<?php
/**
 * 添加关键词项目
 */
namespace Statistics\Controller;
use Common\Controller\AdminbaseController;
class KeywordsrankController extends AdminbaseController {
    public function addProject() {
        $domain = $_SERVER['SERVER_NAME'];
        $project_info = M('keywordProject')->where("domain='" . $domain . "' and status = 1")->find();
        if ($project_info) {
            $domain = $project_info["domain"];
            $name = $project_info["name"];
            $this->assign('domain', $domain);
            $this->assign('name', $name);
            $this->display();
            return;
        }
        $this->assign('domain', $domain);
        $this->display();
    }
    /**
     * 保存项目信息
    */
    function saveProject() {
        $name = I('post.name');
        $domain = $_SERVER['SERVER_NAME'];
        $project_info = M('keywordProject')->where("domain='" . $domain . "' and status = 1")->find();
        if ($project_info) {
            $this->error("当前域名已存在！");
            $this->display('addProject');
            return;
        }

        $result = zccurl('AntRanks/ProjectInfo/createProject', array('projectName' => $name, 'domain_url' => $domain));
        if (empty($result)) {
            $this->error("保存失败！");
            $this->display('addProject');
        }
        $json_project = json_decode($result);
        if ($json_project->status == "error") {
            $this->error($json_project->description);
            $this->display('addProject');
        }
        if ($json_project->status == "OK") {
            $dataSave = array("pro_id" => $json_project->project_id, "name" => $name, "domain" => $domain, "status" => 1, "gmt_create" =>  date("Y-m-d h:i:s"));
            $resultSave = M('keywordProject')->data($dataSave)->add();
            if ($resultSave) {
                $this->success("保存成功！", U("Keywordsrank/addProject"));
            } else{
               $this->error("保存失败！");
               $this->display('addProject');
            }

        }
    }
    /**
     * 删除项目信息
     * "{"status":"", "description":"Not found", "project_id":3269207}"
     * "{"status":"OK", "description":"Delete project", "project_id":3269766}"
    */
    function delProject() {
        $domain = I('get.domain');
        $data['status'] = 0;
        $data['gmt_modified'] = date("Y-m-d h:i:s");
        $project_info = M('keywordProject')->where("domain='" . $domain . "' and status = 1")->find();
        if ($project_info) {
            $pro_id = $project_info["pro_id"];
            $delResult = zccurl('AntRanks/ProjectInfo/delProject', array('project_id' => $pro_id));
            if (empty($delResult)) {
                $this->error("删除失败！");
                $this->display('addProject');
            }
            $json_project = json_decode($delResult);
            if ($json_project->status == "") {
                $this->error($json_project->description);
                $this->display('addProject');
            }
            if ($json_project->status == "OK") {
                $updateResult =  M('keywordProject')->where("domain='" . $domain . "' and status = 1")->save($data);
                M('keywordsList')->execute("truncate table cmf_keywords_list");
                if ($updateResult) {
                    $this->success("删除成功！", U("Keywordsrank/addProject"));
                } else{
                    // $this->error("保存失败！");
                    $this->display('addProject');
                }
            }
        }
    }
}
?>