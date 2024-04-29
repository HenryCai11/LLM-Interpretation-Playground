cd ..

lr_list=(3e-3 4e-3 5e-3 6e-3)

for lr in "${lr_list[@]}"
do
    CUDA_VISIBLE_DEVICES=0 python -m self_control.prefix_control.adapter_no_trainer \
        --training_set_name happy2sad-1k-search-3iter \
        --eval_set_name happy2sad-eval-search-3iter \
        --attribute happy2sad \
        --batchsize 32 \
        --lr $lr \
        --accumulation_steps 16 \
        --peft_type "llama-adapter" \
        --max_num_data 1000 \
        # --pick_by_eval 

    # CUDA_VISIBLE_DEVICES=1 python -m self_control.prefix_control.adapter_no_trainer \
    #     --training_set_name happy2sad-1k-search-3iter \
    #     --eval_set_name happy2sad-eval-search-3iter \
    #     --attribute happy2sad \
    #     --batchsize 32 \
    #     --lr $lr \
    #     --accumulation_steps 16 \
    #     --peft_type "llama-adapter" \
    #     --pick_by_eval \
    #     --do_test

done